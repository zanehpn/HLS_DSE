import argparse
import json
import os


def detect_encoding(path):
    """
    Detect file encoding by checking BOM for UTF-16, otherwise use UTF-8-SIG.
    """
    with open(path, 'rb') as bf:
        raw_start = bf.read(2)
    if raw_start in (b'\xff\xfe', b'\xfe\xff'):
        return 'utf-16'
    return 'utf-8-sig'


def convert_json_to_jsonl(input_path, output_path):
    """
    Load a JSON file (either a list or dict) and write each element as a JSONL line.
    Malformed entries are skipped.
    """
    enc = detect_encoding(input_path)
    print(f"Reading {input_path} with encoding={enc}...")
    with open(input_path, 'r', encoding=enc, errors='replace') as f:
        try:
            data = json.load(f)
        except json.JSONDecodeError as e:
            print(f"Failed to parse JSON: {e}")
            return

    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, 'w', encoding='utf-8') as out:
        if isinstance(data, list):
            iterable = data
        elif isinstance(data, dict):
            iterable = data.values()
        else:
            print(f"Unsupported JSON root type: {type(data)}")
            return

        for i, elem in enumerate(iterable, 1):
            try:
                line = json.dumps(elem, ensure_ascii=False)
            except (TypeError, OverflowError) as e:
                print(f"Skipping element #{i} due to serialization error: {e}")
                continue
            out.write(line + '\n')
    print(f"Wrote JSONL to {output_path}")


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Convert JSON to JSONL safely.")
    parser.add_argument('input', help="Path to the input JSON file.")
    parser.add_argument('output', help="Path to the output JSONL file.")
    args = parser.parse_args()

    convert_json_to_jsonl(args.input, args.output)

