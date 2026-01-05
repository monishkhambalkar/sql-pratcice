/*

SQL Language Categories (MASTER LEVEL)

SQL commands are grouped based on what kind of job they do in the database.

The 5 Main SQL Language Categories

| Category | Full Form                    | Purpose                     |
| -------- | ---------------------------- | --------------------------- |
| **DDL**  | Data Definition Language     | Define database structure   |
| **DML**  | Data Manipulation Language   | Insert, update, delete data |
| **DQL**  | Data Query Language          | Read / fetch data           |
| **DCL**  | Data Control Language        | Access & permission control |
| **TCL**  | Transaction Control Language | Manage transactions         |


1.  DDL – Data Definition Language
        DDL is used to define, change, or remove database objects.
        Tables, indexes, views, constraints, schemas

2.  Why we use DDL?
        To create tables
        To modify table structure
        To delete tables
        To define indexes & constraints 

3.  Common DDL Commands
    | Command    | Use                              |
    | ---------- | -------------------------------- |
    | `CREATE`   | Create objects                   |
    | `ALTER`    | Modify structure                 |
    | `DROP`     | Delete object                    |
    | `TRUNCATE` | Remove all data (keep structure) |
    | `RENAME`   | Rename object                    |

CREATE TABLE User(
    user_id INT PRIMARY KEY,
    name varchar(100),
    created_at DATETIME,
    created_by INT,
    status INT
);

ALTER TABLE User ADD COLUMN phone after name

DCL  data constrol language 

GRANT SELCT , INSERT
on Tenent

REVOKE delete on Tenent 

