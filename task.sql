USE mydatabase;
DROP TABLE Books;
-- 1.creating the table
CREATE TABLE Books(
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(60) NOT NULL,
  isbn VARCHAR(20) UNIQUE,
  price  DECIMAL(20,3),
  published_date DATE,
  in_stock INT DEFAULT 1);
 
  
  DROP TABLE Books;
  
  DESC Books;
  
  
  -- 2.Inserting data
  
  INSERT INTO Books(title,isbn,price,published_date,in_stock)VALUES
  ('java','123',500,'2026-01-01',3),
  ('history','456',200,'2021-02-02',4),
  ('db','678',300,'2020-03-03',5),
  ('ds','901',400,'2018-04-04',2),
  ('dbms','345',100,'2030-05-05',0);
  
  SELECT *
  FROM Books;
  
  -- 3. renaming a column
  
  ALTER TABLE Books
  CHANGE COLUMN title book_title VARCHAR(70);
  
  -- 4. changing columns datatype name
  
  ALTER TABLE Books
  MODIFY COLUMN price FLOAT;
  SELECT * FROm Books;
 
 -- 5.adding a new value with constraint
 
 ALTER TABLE Books
 ADD COLUMN author_name VARCHAR(60) NOT NULL DEFAULT 'Unknown';
 
 -- 6.updating existing data
 
 UPDATE Books
SET price = price * 0.9
WHERE published_date < '2020-01-01';

-- 7.deleting specific records

DELETE FROM Books
WHERE in_stock=0;
select * from Books;

-- 8.resetting the auto increment values
ALTER TABLE Books
AUTO_INCREMENT=101;

-- 9 . Conditional SELECT with Pattern Matching
SELECT title,price,published_date
FROM Books
WHERE title LIKE '%history%' AND price > 300
ORDER BY price DESC;
-- 10  Working with a Second Table (Joins-ready setup)

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(100) NOT NULL,
    join_date DATE NOT NULL DEFAULT 1);
INSERT INTO Members (member_name, join_date)
VALUES
('abcd', '2024-01-15'),
('aaaa', '2023-11-20'),
('bbbb', '2024-06-18'),
('cccc', '2024-03-25'),
('dddd', '2025-01-10');
SELECT * FROM Members
WHERE YEAR(join_date) = 2024
ORDER BY member_name ASC;
SELECT * FROM Members;
DROP TABLE Members;
