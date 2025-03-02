--select * from dbo.customer_journey

--  To check the duplicate rows 

/*with DuplicateRecords as (
select
JourneyID,
CustomerID,
ProductID,
VisitDate,
Stage,
Action,
Duration,
ROW_NUMBER() over(
	partition by CustomerID,ProductID,VisitDate,Stage,Action,Duration
	order by JourneyID
	) as row_num
from dbo.customer_journey
)
select * from DuplicateRecords 
where row_num>1
order by JourneyID*/

--Query to select only cleaned data

select
JourneyID,
CustomerID,
ProductID,
VisitDate,
Stage,
Action,
COALESCE(Duration, avg_duration) AS Duration
from
(
select 
JourneyID,
CustomerID,
ProductID,
VisitDate,
UPPER(Stage) as Stage,
Action,
Duration,
AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration,  -- Calculates the average duration for each date, using only numeric values
            ROW_NUMBER() OVER (
                PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action  -- Groups by these columns to identify duplicate records
                ORDER BY JourneyID  -- Orders by JourneyID to keep the first occurrence of each duplicate
            ) AS row_num 
from
dbo.customer_journey
) as subquery
where row_num=1;