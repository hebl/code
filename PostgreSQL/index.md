### 索引主键等

#### 添加主键

```sql
ALTER TABLE xxx ADD CONSTRAINT xxx_pk PRIMARY KEY (pk);
```

#### 索引

```
CREATE INDEX xxx_idx_col ON xxx USING BTREE(col);
```
