import tushare as ts
df = ts.get_report_data(2014,3)
df.to_csv('201403.csv')

