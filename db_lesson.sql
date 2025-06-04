▷Q1
USE db_lesson;
CREATE TABLE departments (department_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, name VARCHAR(20) NOT NULL, created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
DESC departments;

▷Q2
ALTER TABLE people ADD COLUMN department_id INT UNSIGNED AFTER email;
DESC people;

▷Q3
INSERT INTO departments (name) VALUES ('営業'), ('開発'), ('経理'), ('人事'), (‘情報システム’);
INSERT INTO people (name, department_id) VALUES
  ('佐藤 太郎', 1),
  ('鈴木 次郎', 1),
  ('高橋 三郎', 1),
  ('田中 四郎', 2),
  ('伊藤 五郎', 2),
  ('渡辺 花子', 2),
  ('中村 美咲', 2),
  ('山本 久美', 3),
  ('小林 陽子', 4),
  ('加藤 健一', 5);
INSERT INTO reports (person_id, content) VALUES
(1, '2025年6月 テスト日報作成1’),
(2, '2025年6月 テスト日報作成2’),
(3, '2025年6月 テスト日報作成3’),
(4, '2025年6月 テスト日報作成4’),
(5, '2025年6月 テスト日報作成5’),
(6, '2025年6月 テスト日報作成6’),
(7, '2025年6月 テスト日報作成7’),
(8, '2025年6月 テスト日報作成8’),
(9, '2025年6月 テスト日報作成9’),
(10, '2025年6月 テスト日報作成10');

▷Q4
SELECT * FROM people;
UPDATE people SET department_id = 1 WHERE department_id IS NULL;

▷Q5
UPDATE people SET age = 30, gender = 1 WHERE person_id = 1;
UPDATE people SET age = 27, gender = 2 WHERE person_id = 2;
UPDATE people SET age = 35, gender = 1 WHERE person_id = 3;
UPDATE people SET age = 28, gender = 1 WHERE person_id = 4;
UPDATE people SET age = 40, gender = 1 WHERE person_id = 5;
UPDATE people SET age = 26, gender = 2 WHERE person_id = 6;
UPDATE people SET age = 32, gender = 1 WHERE person_id = 7;
UPDATE people SET age = 45, gender = 2 WHERE person_id = 8;
UPDATE people SET age = 29, gender = 2 WHERE person_id = 9;
UPDATE people SET age = 37, gender = 1 WHERE person_id = 10;

select name, age from people where gender = 1 order by age desc;

▷Q6
peopleテーブルから部署IDが1の人たちの名前、メールアドレス、年齢を、作成日時（created_at）の昇順で取得


▷Q7
select name from people where (gender = 2 and age between 20 and 29) or (gender = 1 and age between 40 and 49);

▷Q8
select name from people where department_id = 1 order by age asc;

▷Q9
select name from people where (gender=2 and age between 20 and 29) or (gender=1 and age between 40 and 49);

▷Q10
select p.name, d.name, r.content from reports as r join people as p on r.person_id=p.person_id join departments as d on d.department_id = p.department_id;

▷Q11
delete from reports where person_id = 10;
select p.name from people AS p LEFT JOIN reports AS r ON p.person_id = r.person_id
where r.person_id is null;

