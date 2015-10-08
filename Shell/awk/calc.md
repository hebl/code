1. 列求和

```
awk 'BEGIN { sum = 0 }{ sum += $1 } END {print sum}' data.txt
```

2. 求平均

```
awk 'BEGIN { sum = 0 }{ sum += $1 } END {print sum/NR}' data.txt
```

3. 求最大值

```
awk 'BEGIN { max = 0 }{ if ($1 > max) max = $1 fi } END {print max}' data.txt
```

4. 求最小值

```
awk 'BEGIN { min = 1999999 }{ if ($1 < min) min = $1 fi } END {print min}' data.txt
```
