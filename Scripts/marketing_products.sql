--select * from dbo.products

--Categorizing products according to their price range

select
ProductID,
ProductName,
Price,
case
	when Price<50 then 'Low'
	when Price between 50 and 150 then 'Medium'
	when Price between 150 and 250 then 'High'
	else 'Very High'
end	as 'Price Category'
from dbo.products