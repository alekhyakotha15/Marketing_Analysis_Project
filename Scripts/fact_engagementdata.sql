--select * from dbo.engagement_data

--Query to clean and normalize the customer engagement data

select
EngagementID,
ContentID,
CampaignID,
ProductID,
upper(replace(ContentType,'Socialmedia','Social Media')) as ContentType,
LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,
RIGHT(ViewsClicksCombined,LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks,
Likes,
FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') AS EngagementDate
from dbo.engagement_data
where ContentType not like 'newsletter'

