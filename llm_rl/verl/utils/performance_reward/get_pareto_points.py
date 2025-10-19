import os
import pandas as pd
import numpy as np

def simple_cull(inputPoints, dominates):
    paretoPoints = set()
    candidateRowNr = 0
    dominatedPoints = set()
    while True:
        candidateRow = inputPoints[candidateRowNr]
        inputPoints.remove(candidateRow)
        rowNr = 0
        nonDominated = True
        while len(inputPoints) != 0 and rowNr < len(inputPoints):
            row = inputPoints[rowNr]
            if dominates(candidateRow, row):
                # If it is worse on all features remove the row from the array
                inputPoints.remove(row)
                dominatedPoints.add(tuple(row))
            elif dominates(row, candidateRow):
                nonDominated = False
                dominatedPoints.add(tuple(candidateRow))
                rowNr += 1
            else:
                rowNr += 1

        if nonDominated:
            # add the non-dominated point to the Pareto frontier
            paretoPoints.add(tuple(candidateRow))

        if len(inputPoints) == 0:
            break
    return paretoPoints, dominatedPoints


def dominates(row, candidateRow):
    return sum([row[x] <= candidateRow[x] for x in range(len(row))]) == len(row)

def get_pareto_points(index: int, tidy_data, return_dominated: bool = False):
    """
    Compute pareto points for the benchmark at `index`.

    Args:
        index: integer index into nameList/folderList/powerList/... (0-based)
        tidy_data: path to directory containing tidy csv files
        return_dominated: if True, also return dominatedPoints

    Returns:
        paretoPoints (list). If return_dominated True, returns (paretoPoints, dominatedPoints).
    """

    # Constants (copied from your original script)
    WLUT: float = 0.3
    WFF: float = 0.25
    WDSP: float = 0.3
    WBRAM: float = 0.05
    wght = [WLUT, WFF, WDSP, WBRAM]

    noLatList = ['bfs_bulk', 'fft_strided', 'nw', 'stencil3d']

    nameList = ['aes', 'bfs_bulk', 'fft_strided', 'gemm_ncubed', 'md_knn', 'nw', 'sort_radix', 'spmv_ellpack',
                'stencil3d', 'viterbi']
    folderList = ['aes/aes', 'bfs/bulk', 'fft/strided', 'gemm/ncubed', 'md/knn', 'nw/nw', 'sort/radix', 'spmv/ellpack',
                  'stencil/stencil3d', 'viterbi/viterbi']
    algList = ['sa.csv', 'nsga.csv', 'motpe_d.csv', 'motpe_f.csv', 'motpe_fl.csv']

    powerList = [0.361, 0.249, 0.301, 0.308, 1.516, 0.258, 0.253, 0.314, 0.278, 0.426]
    latList = [713, 1000, 1000, 131369, 2467, 33664, 166289, 2529, 52821, 294737]
    cpList = [7.742, 3.804, 9.064, 7.788, 9.716, 4.763, 4.189, 7.631, 6.187, 9.122]
    areaList = [5144.1, 288.7, 1343.8, 4305.05, 22375.35, 445.8, 1313.15, 1716.25, 310.9, 13590.3]

    # Validate index
    if not (0 <= index < len(nameList)):
        raise IndexError(f"index {index} out of range (0..{len(nameList)-1})")

    name = nameList[index]
    power = powerList[index]
    cp = cpList[index]
    area = areaList[index]

    # CSV paths
    csv_paths = [os.path.join(tidy_data, f"{name}_{alg}") for alg in algList]

    # Read dataframes, raising helpful error if any missing
    dfs = []
    for p in csv_paths:
        if not os.path.isfile(p):
            raise FileNotFoundError(f"CSV not found: {p}")
        dfs.append(pd.read_csv(p, sep=','))

    # Determine number of rows to iterate: min rows across all files (avoid fixed 100)
    nrows = min(df.shape[0] for df in dfs)
    if nrows == 0:
        raise ValueError("One of the CSVs is empty.")

    # prepare containers
    inputPoints = []
    # iterate through rows
    for idx in range(nrows):
        # helper to compute area-normalized usage
        def area_norm(row):
            usg = [row['lut'], row['ff'], row['dsp'], row['bram']]
            return float(np.sum(np.multiply(wght, usg)) / area)

        # SA
        sa = dfs[0].iloc[idx]
        sa_pwr = float(sa['pwr']) / power
        sa_cp = float(sa['cp']) / cp
        if name not in noLatList:
            sa_lat = float(sa['lat']) / latList[index]
            sa_point = [sa_pwr, sa_lat, sa_cp, area_norm(sa)]
        else:
            sa_point = [sa_pwr, sa_cp, area_norm(sa)]
        inputPoints.append(sa_point)

        # NSGA
        nsga = dfs[1].iloc[idx]
        nsga_pwr = float(nsga['pwr']) / power
        nsga_cp = float(nsga['cp']) / cp
        if name not in noLatList:
            nsga_lat = float(nsga['lat']) / latList[index]
            nsga_point = [nsga_pwr, nsga_lat, nsga_cp, area_norm(nsga)]
        else:
            nsga_point = [nsga_pwr, nsga_cp, area_norm(nsga)]
        inputPoints.append(nsga_point)

        # MOTPE_D
        motpe_d = dfs[2].iloc[idx]
        motpe_d_pwr = float(motpe_d['pwr']) / power
        motpe_d_cp = float(motpe_d['cp']) / cp
        if name not in noLatList:
            motpe_d_lat = float(motpe_d['lat']) / latList[index]
            motpe_d_point = [motpe_d_pwr, motpe_d_lat, motpe_d_cp, area_norm(motpe_d)]
        else:
            motpe_d_point = [motpe_d_pwr, motpe_d_cp, area_norm(motpe_d)]
        inputPoints.append(motpe_d_point)

        # MOTPE_F
        motpe_f = dfs[3].iloc[idx]
        motpe_f_pwr = float(motpe_f['pwr']) / power
        motpe_f_cp = float(motpe_f['cp']) / cp
        if name not in noLatList:
            motpe_f_lat = float(motpe_f['lat']) / latList[index]
            motpe_f_point = [motpe_f_pwr, motpe_f_lat, motpe_f_cp, area_norm(motpe_f)]
        else:
            motpe_f_point = [motpe_f_pwr, motpe_f_cp, area_norm(motpe_f)]
        inputPoints.append(motpe_f_point)

        # MOTPE_FL
        motpe_fl = dfs[4].iloc[idx]
        motpe_fl_pwr = float(motpe_fl['pwr']) / power
        motpe_fl_cp = float(motpe_fl['cp']) / cp
        if name not in noLatList:
            motpe_fl_lat = float(motpe_fl['lat']) / latList[index]
            motpe_fl_point = [motpe_fl_pwr, motpe_fl_lat, motpe_fl_cp, area_norm(motpe_fl)]
        else:
            motpe_fl_point = [motpe_fl_pwr, motpe_fl_cp, area_norm(motpe_fl)]
        inputPoints.append(motpe_fl_point)

    # Compute pareto front using provided simple_cull and dominates
    paretoPoints, dominatedPoints = simple_cull(inputPoints, dominates)

    if return_dominated:
        return paretoPoints, dominatedPoints
    return paretoPoints

def get_pareto_points_from_pickle(name, tidy_data, return_dominated: bool = False):
    """
    Load pareto points from pickle for the benchmark at `index`.

    Args:
        index: integer index into nameList/folderList/powerList/... (0-based)
        tidy_data: path to directory containing tidy csv files
        return_dominated: if True, also return dominatedPoints (will be None)

    Returns:
        paretoPoints (list). If return_dominated True, returns (paretoPoints, None).
    """
    pareto_data = os.path.join(tidy_data, f"{name}_pareto.pkl")

    if not os.path.isfile(pareto_data):
        raise FileNotFoundError(f"Pareto pickle not found: {pareto_data}")

    import pickle
    with open(pareto_data, "rb") as f:
        paretoPoints = pickle.load(f)

    if return_dominated:
        return paretoPoints, None
    print("Pareto Points: ", paretoPoints)
    return paretoPoints
