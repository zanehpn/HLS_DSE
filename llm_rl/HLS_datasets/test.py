import pandas as pd
p = "/home/zqy/DSE/Logic-RL/HLS_datasets/test.parquet"
df = pd.read_parquet(p, columns=['chat'])
print(df['chat'].head(10))
print(df['chat'].apply(type).value_counts())