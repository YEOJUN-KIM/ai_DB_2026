--실습문제

DROP TABLE IF EXISTS products;

CREATE TABLE products (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name VARCHAR(100) NOT NULL,
price INT NOT NULL,
stock INT DEFAULT 0,
category VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO products (name, price, stock, category)
VALUES
('키보드', 30000, 10, '컴퓨터주변기기'),
('마우스', 15000, 20, '컴퓨터주변기기'),
('모니터', 250000, 5, '디스플레이'),
('USB 메모리', 12000, 30, '저장장치'),
('노트북 거치대', 22000, 8, '액세서리'),
('웹캠', 45000, 12, '컴퓨터주변기기'),
('외장하드', 89000, 7, '저장장치'),
('노트북 파우치', 18000, 15, '액세서리'),
('HDMI 케이블', 9000, 40, '케이블'),
('무선 이어폰', 79000, 6, '음향기기');


-- 1. 전체 상품을 조회하시오.
select * from products p;

-- 2. 상품명과 가격만 조회하시오.
select name, price from products p;

-- 3. 가격이 20000원 이상인 상품을 조회하시오.
select * from products p
where p.price >= 20000;

-- 4. 재고가 10개 이하인 상품을 조회하시오.
select * from products p
where p.stock <=10;

-- 5. 가격이 높은 순서대로 정렬하시오.
select * from products p
order by price desc;

-- 6. 가장 비싼 상품 2개만 조회하시오.
select * from products p
order by price desc
limit 2;

-- 7. 마우스의 가격을 18000원으로 수정하시오.
update products p set price = 18000
where name = '마우스';
select * from products
where name = '마우스';

-- 8. USB 메모리의 재고를 25개로 수정하시오.
update products p set stock = 25
where name = 'USB 메모리';
select * from products
where name = 'USB 메모리';

-- 9. 노트북 거치대 데이터를 삭제하시오.
delete from products 
where name= '노트북 거치대';
select * from products;

-- 10. 삭제 후 전체 상품을 다시 조회하시오.
delete from products;
select * from products;





