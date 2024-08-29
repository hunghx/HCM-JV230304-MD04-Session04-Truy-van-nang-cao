-- tính tổng dân số thế giới
select sum(population) from `world`.`country`;
-- tính tổng dân số của mỗi quốc gia được thống kế trong bảng thành phố

select country.code, sum(city.population), country.Population from city 
join country on city.CountryCode = country.Code
where country.code IS NOT NULL
group by country.code
;

select * from city where CountryCode LIKE 'RUS';

-- lấy những thành phố có dân số > 100000 người của nga

select * from (select * from city where CountryCode LIKE 'RUS') as view_city_rus
where view_city_rus.population>100000;

-- lấy những quốc gia có tổng số thành phố nhiều nhất

-- tính số lượng thành phố lớn nhất 
 select count(id) from city 
group by countrycode
order by count(id) desc limit 1;

-- lấy ra những quốc qua có số luong hành phố = 363
select CountryCode,count(id) from city 
group by countrycode 
having count(id) = (select count(id) from city 
group by countrycode
order by count(id) desc limit 1);

-- so sánh 
select CountryCode,count(id) `tong` from city 
group by countrycode ;

select countrycode, tong from (select CountryCode,count(id) `tong` from city 
group by countrycode ) ct
 where tong >= 
 ALL(select tong from (select CountryCode,count(id) `tong` from city 
group by countrycode ) c);


-- UNION
select * from city
union
select code, name, population, localname, capital  from country;

-- các cú pháp 
-- toán tử 3 ngôi : sử dụng hàm IF();

select *, IF(diem < 5,'Không đạt', 'Đạt') `xep hang` from ketqua;

-- nhiều trường hợp : case ... when (switch case)

select *, case when diem < 5 then 'Yeu'
                when diem < 6.5 then 'trung binh'
                when diem < 8 then 'Kha'
                else 'Gioi'
                end
  `xep hang` from ketqua;
  select *, case diem when 4.5 then 'Yeu'
                when 6 then 'trung binh'
                when 8 then 'Kha'
                else 'Gioi'
                end
  `xep hang` from ketqua;
  -- if else , case when của khối lệnh 
  
  

