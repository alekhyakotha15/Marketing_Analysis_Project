--select * from dbo.customers

--Combining Customers with geography table to get all their information
select 
c.CustomerID,
c.CustomerName,
c.Email,
c.Gender,
c.Age,
c.GeographyID,
g.Country,
g.City
from dbo.customers as c left join
dbo.geography g on c.GeographyID=g.GeographyID