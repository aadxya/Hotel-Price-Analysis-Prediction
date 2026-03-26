------------------------------------------------- QUESTION 1 ----------------------------------------------------
-- HOW MUCH DATA DO WE HAVE?
select count(*) from price_data; --1467

-- HOW MUCH DATA PER YEAR?
select year(date) as year, count(*) 
from price_data
where price is not null 
group by 1  
order by 1; 


--- NULL DATA? --- No null data found
select count(*) from price_data
where price is null;


-- Quick sanity check on the raw table
select 
min(date) as firstdate,
max(date) as latestdate,
count(*) as total,
min(price) as min_price,
max(price) as max_price,
round(avg(price),2) as avg_price
from price_data;



--------- ONLY 2016 HAS LESS DATA SO WE WON'T TAKE IT INTO CONSIDERATION 
--------- Created a new table "CLEAN_PRICES" with 2012 - 2015 data

-------- RAW.CSV
CREATE OR replace VIEW clean_prices AS
(
    select * from 
    (
       SELECT
            DATE(Date) AS date,
            YEAR(date) as year,
            MONTH(DATE) AS month,
            DAY(DATE) AS day,
            dayofyear(DATE) AS day_of_year,
            price
        FROM price_data
    )
    where year != 2016
);


select * from clean_prices;


-----------------------------------YoY DAY OF YEAR VIEW ---------------------------
create or replace view yoy as
select 
    year, day_of_year,month, price,
    from clean_prices
    order by 1,2
;


-------------------------- DAILY_YOY.CSV
select * from yoy;

select year, avg(average_price) from yoy group by 1 order by year;


----------------- WEEKDAY.CSV
Select year, 
case 
    when weekday =0 then 'Monday'
    when weekday=1 then 'Tuesday'
    when weekday =2 then 'Wednesday'
    when weekday=3 then 'Thursday'
    when weekday =4 then 'Friday'
    when weekday=5 then 'Saturday'
    when weekday =6 then 'Sunday'
end as weekday, 
price
from 
(
    select year, dayofweek(date) as weekday, price 
    from clean_prices
    order by 1,2,3
);




--------------------------------------------- QUESTION 3 --------------------------------------------------

-------------------- FEB GROWTH QUERY---------------

create or replace view feb_growth as
select year, 
round(avg(ifnull((average_price - prev_price)*100/average_price, 0)), 2) as average_growth
from
(
    select 
    year, 
    average_price, 
    lag(average_price) over (order by year) as prev_price
    
    from
    (    select year(date) as year, month(date) as month, avg(price) as average_price
        from price_data
        group by 1,2
        order by 1,2,3
    )
    where year != 2016
    and month = 2
)
group by 1
order by 1;

select * from feb_growth;

---------- FEB2015.CSV
select date,price
from
(select *, year(date) as year,
month(date) as month
from price_data )
where year = 2015
and month = 2
order by 1,2;



---------- FEBCOMPLETE.CSV
select date,price
from
(select *, year(date) as year,
month(date) as month
from price_data )
where year != 2016
and month = 2
order by 1,2;

