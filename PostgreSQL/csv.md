### `psql`导出`csv`格式文件

```
psql -A -F ',' -P footer=off -U usr -d db -c 'sql' -o out.csv
```
