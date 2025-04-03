-- vsCode의 sqlite 확장 설치
-- 오른쪽 버튼 use Database => choose database =>  오른쪽 버튼 Run Query

CREATE TABLE test (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TXT,
    age INTEGER
);

ALTER TABLE test RENAME TO user;

ALTER TABLE user ADD COLUMN email TEXT;

ALTER TABLE user RENAME COLUMN name TO username;

DROP TABLE user;