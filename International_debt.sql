-- inspecting the dataset
select * from international_debt;

-- number of indicators in the dataset
select count(distinct indicator_code) as indicators
from international_debt;

-- distinct debt indicators and their name
select distinct (indicator_code) as distinct_debt_indicators,
				indicator_name
from international_debt
order by distinct_debt_indicators;

-- number of countries in the dataset
select count(distinct country_name) unique_countries
from international_debt;

-- total debt owed by the countries is $3trillion
select round(sum(debt), 2) 
from international_debt;

-- top 3 countries with highest debt
select country_name,
	   round(sum(debt), 2) as total_debt
from international_debt
group by country_name
order by total_debt desc
limit 3;

-- average amount of debt owed across all indicators
select country_name, 
	   indicator_code as debt_indicator,
       indicator_name,
       round(avg(debt), 2) as average_debt
from international_debt
group by debt_indicator, indicator_name
order by average_debt desc
limit 10;

-- highest amount of principal repayment
select country_name, indicator_name, debt
from international_debt
where debt = 
	  (select max(debt) from international_debt
       where indicator_code = 'DT.AMT.DLXF.CD');
       
-- most common debt indicator
select country_name, 
	   indicator_code, 
       indicator_name, 
       count(indicator_code) as indicator_count
from international_debt
group by indicator_code
order by indicator_count desc, indicator_code desc
limit 20;

-- maximum amount of debt by country
select country_name, max(debt) as maximum_debt
from international_debt
group by country_name
order by maximum_debt desc
limit 10;