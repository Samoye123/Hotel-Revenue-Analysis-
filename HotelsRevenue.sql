/* Hotel Revenue Data Exploration

Skills Used: union, Temp Table, Creating View 
*/


select *
from dbo.[Year 2018]
select *
from dbo.[Year 2019]
select *
from dbo.[Year 2020]

-- Unified Dataset

select *
from dbo.[Year 2018]
union
select *
from dbo.[Year 2019]
union
select *
from dbo.[Year 2020]


--Using a Temp table from previous query

WITH  HotelsCom
as
(
select *
from dbo.[Year 2018]
union
select *
from dbo.[Year 2019]
union
select *
from dbo.[Year 2020])

select *
from HotelsCom 


-- Looking at the revenue generated each year by hotel type in previous query


 WITH  HotelsCom
as
(
select *
from dbo.[Year 2018]
union
select *
from dbo.[Year 2019]
union
select *
from dbo.[Year 2020])

select arrival_date_year, hotel,
round (sum((stays_in_week_nights + stays_in_weekend_nights)* adr),2) as Revenue
from HotelsCom
group by  arrival_date_year, hotel


--Creating views


WITH  HotelsCom
as
(
select *
from dbo.[Year 2018]
union
select *
from dbo.[Year 2019]
union
select *
from dbo.[Year 2020])

select *
from HotelsCom 
left join dbo.market_segment
on HotelsCom.market_segment = market_segment.market_segment
left join dbo.meal_cost
on meal_cost.meal = HotelsCom.meal


