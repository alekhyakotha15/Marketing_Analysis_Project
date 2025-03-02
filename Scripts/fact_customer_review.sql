--select * from dbo.customer_reviews

--Removing extra spaces between words in Review Texts which is important to perform later analysis

select
ReviewID,
CustomerID,
ProductID,
ReviewDate,
Rating,
REPLACE(ReviewText,'  ',' ') as ReviewText
from dbo.customer_reviews