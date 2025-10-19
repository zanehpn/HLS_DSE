import numpy as np
from verl.utils.performance_reward.get_pareto_points import *
from typing import Tuple, Optional

root = 'xxx' #add your path here
# ---------- helpers ----------
def dominates(a, b, minimize=True, eps=0.0):
    a = np.array(a, dtype=float); b = np.array(b, dtype=float)
    if minimize:
        le = a <= b + eps
        lt = a < b - eps
        return np.all(le) and np.any(lt)
    else:
        ge = a >= b - eps
        gt = a > b + eps
        return np.all(ge) and np.any(gt)

def proportion_dominated(candidate, reference_set, minimize=True, eps=0.0,
                         weights=None, smooth_alpha=1e-6, smooth_beta=1e-6,
                         subsample=None, rng=None):
    R = np.array(reference_set, dtype=float)
    N = R.shape[0]
    if N == 0:
        return 0.0
    # subsample for speed/stochasticity
    if subsample is not None and subsample < N:
        rng = np.random if rng is None else rng
        idx = rng.choice(N, subsample, replace=False)
        R = R[idx]; N = R.shape[0]
    dominated = 0.0
    for i, r in enumerate(R):
        if dominates(candidate, r, minimize=minimize, eps=eps):
            dominated += (weights[i] if weights is not None else 1.0)
    denom = (np.sum(weights) if weights is not None else N)
    return (dominated + smooth_alpha) / (denom + smooth_beta)

# ---------- log-product / geometric score ----------
def log_product(candidate, eps=1e-9):
    x = np.array(candidate, dtype=float)
    x_shift = x + eps
    x_shift = np.maximum(x_shift, eps)
    return np.sum(np.log(x_shift))   # lower is better

def normalize_to_0_1(value, ref_min, ref_max, clip=True):
    if ref_max == ref_min:
        return 0.5
    v = (value - ref_min) / (ref_max - ref_min)
    return float(np.clip(v, 0.0, 1.0)) if clip else float(v)

# ---------- build normalized components from reference sets ----------
def build_ref_stats(ref_points, eps=1e-9):
    # precompute neg_log_sums for normalization
    ref_arr = np.array(ref_points, dtype=float)
    neg_log_sums = []
    for r in ref_arr:
        neg_log_sums.append(-log_product(r, eps=eps))
    neg_log_sums = np.array(neg_log_sums)
    # use min and 95th percentile to reduce outlier influence
    lo = neg_log_sums.min()
    hi = np.percentile(neg_log_sums, 95)
    if hi == lo:
        hi = neg_log_sums.max()
    return {"neg_log_min": lo, "neg_log_95": hi, "neg_log_arr": neg_log_sums}

# ---------- combined reward ----------
def combined_score(candidate, ref_points, ref_stats,
                    lambda_prod=0.1, lambda_dom=1.0, eps=1e-9,
                    dom_eps=0.0, subsample_ref=200, infeasible_penalty=-1.0):
    # feasibility check hook (user must implement check_feasible)
    # if not check_feasible(candidate):
    #     return infeasible_penalty

    # 1) proportion dominated (subsample reference if large)
    prop = proportion_dominated(candidate, ref_points, minimize=True, eps=dom_eps,
                                 subsample=min(subsample_ref, len(ref_points)))

    # 2) log-product normalized: compute neg_log_sum and normalize to [0,1]
    neg_log = -log_product(candidate, eps=eps)
    # normalize using ref_stats (lo..hi)
    lo = ref_stats["neg_log_min"]; hi = ref_stats["neg_log_95"]
    prod_norm = normalize_to_0_1(neg_log, lo, hi)

    # 3) combine
    score = lambda_prod * prod_norm + lambda_dom * prop
    return score

def log_product(candidate, eps=1e-9):
    x = np.array(candidate, dtype=float)
    x_shift = x + eps
    x_shift = np.maximum(x_shift, eps)
    return np.sum(np.log(x_shift))

def build_ref_stats(ref_points, eps=1e-9):
    ref_arr = np.array(ref_points, dtype=float)
    neg_log_sums = []
    for r in ref_arr:
        neg_log_sums.append(-log_product(r, eps=eps))
    neg_log_sums = np.array(neg_log_sums)
    lo = neg_log_sums.min()
    hi = np.percentile(neg_log_sums, 95)
    if hi == lo:
        hi = neg_log_sums.max()
    return {"neg_log_min": lo, "neg_log_95": hi, "neg_log_arr": neg_log_sums}

def compute_reward(candidate,
                   name,
                   tidy_data: str = root + '/HGBO-DSE/pareto/train_data_pareto',
                   lambda_prod: float = 0.1,
                   lambda_dom: float = 1.0,
                   eps: float = 1e-9,
                   dom_eps: float = 0.0,
                   subsample_ref: Optional[int] = 200,
                   infeasible_penalty: float = -1.0,
                   return_ref_stats: bool = False):
    """
    Compute reward for `candidate` using pareto reference points for benchmark `index`.

    Args:
        candidate: iterable of numbers (e.g. [0.5,0.5,0.5,0.5]).
        index: same index you use for get_pareto_points.
        tidy_data: path to tidy_data directory.
        lambda_prod, lambda_dom, eps, dom_eps, subsample_ref, infeasible_penalty: forwarded to combined_reward.
        return_ref_stats: if True, return (score, ref_stats).

    Returns:
        score (float) or (score, ref_stats) if return_ref_stats True.

    Notes:
        - This function will convert top-level set -> list and tuple/ndarray -> list,
          preserving each point's internal coordinate order.
        - If an inner point itself is a set (unordered), the function raises an error,
          because coordinate order cannot be safely recovered.
    """
    # get raw pareto points (may be list, set, np.ndarray, ...)
    raw_ref = get_pareto_points_from_pickle(name, tidy_data=tidy_data)

    # normalize top-level container: convert set -> list (ordering of points doesn't matter)
    if isinstance(raw_ref, set):
        raw_ref = list(raw_ref)

    if isinstance(raw_ref, np.ndarray) and raw_ref.dtype == object:
        raw_ref = raw_ref.tolist()

    # sanitize each point: ensure list of floats, preserve internal order if tuple/ndarray/list
    ref_points = []
    bad = []
    for i, p in enumerate(raw_ref):
        if isinstance(p, set):
            # cannot safely recover coordinate order from inner set
            raise TypeError(f"ref_points[{i}] is a set (unordered). "
                            "Coordinate order would be lost — fix get_pareto_points to return ordered sequences.")
        if isinstance(p, (tuple, list, np.ndarray)):
            try:
                arr = [float(x) for x in p]
            except Exception as e:
                bad.append((i, type(p), repr(p)[:200], str(e)))
                continue
            ref_points.append(arr)
        else:
            # scalar -> wrap as single-dim vector (unlikely)
            try:
                ref_points.append([float(p)])
            except Exception as e:
                bad.append((i, type(p), repr(p)[:200], str(e)))

    if bad:
        msg = "compute_reward: invalid elements in ref_points:\n"
        for b in bad[:10]:
            msg += f" idx {b[0]} type {b[1]} sample {b[2]} err {b[3]}\n"
        raise ValueError(msg)

    if len(ref_points) == 0:
        raise ValueError("compute_reward: no valid reference points found.")

    # check consistent dimension
    dims = [len(r) for r in ref_points]
    if len(set(dims)) != 1:
        raise ValueError(f"compute_reward: inconsistent point dimensions in ref_points: {set(dims)}")

    # build ref_stats
    ref_stats = build_ref_stats(ref_points, eps=eps)

    # determine subsample argument for combined_reward (don't request more than available)
    if subsample_ref is not None:
        subsample_arg = min(subsample_ref, len(ref_points))
    else:
        subsample_arg = None

    # compute score
    score = combined_score(candidate, ref_points, ref_stats,
                            lambda_prod=lambda_prod, lambda_dom=lambda_dom,
                            eps=eps, dom_eps=dom_eps,
                            subsample_ref=subsample_arg,
                            infeasible_penalty=infeasible_penalty)

    if return_ref_stats:
        return score, ref_stats
    return score

# Example usage:
# ref_points = [
#     [0.1, 0.2, 0.3, 0.4],
#     [0.2, 0.2, 0.1, 0.6]
# ]

# candidate_bad = [0.1, 0.2, 0.3]   # 3-dim -> should error
# candidate_good = [0.05, 0.15, 0.25, 0.35]

# # after replacing functions above
# try:
#     # this should raise with an informative message
#     score = combined_score(candidate_bad, ref_points, build_ref_stats(ref_points))
# except Exception as e:
#     print("Expected error (bad candidate):", e)

# # this should work
# ref_stats = build_ref_stats(ref_points)
# score = combined_score(candidate_good, ref_points, ref_stats)
# print("Score (good candidate):", score)
