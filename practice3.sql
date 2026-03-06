-- Real Industry Debugging Flow
/*    
    1 identify the slow query log
    2 run explain 
    3 check table scan
    4 check indexes
    5 create composite index   => what is diff between sinple index and composit index, which is best , in which case use which one
    6 rerun explain 
    7 bench mark query
    8 Add caching if required


    TYPE AFTER EXPAIN  : 
        Best Performance
        ↓
        system
        const => MySQL finds exactly one row using PRIMARY KEY (SELECT * FROM products WHERE id = 10;)
        eq_ref => Join using PRIMARY KEY or UNIQUE index One row match only
        ref => MySQL uses index to find matching rows (WHERE category_id = 5)
        range => MySQL scans a range of index values (WHERE price BETWEEN 1000 AND 2000)
        index => full idex scan 
        ALL => worst meaing full table scan (improve with create index for which use in where condition)
        ↑
        Worst Performance


*/