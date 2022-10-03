select (select * from Times as t) a 
,ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS number

