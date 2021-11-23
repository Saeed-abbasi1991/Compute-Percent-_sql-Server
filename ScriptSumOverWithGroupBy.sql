declare @table table(name varchar(50), value int)

insert into @table

select 'A',10
union
select'B',40
union
select 'c',50
union
select 'A',20
union
select'B',80
union
select 'c',100


SELECT t.name,
	   SUM(t.value)SumEveryName
	   ,SUM(SUM(t.value)) OVER ()SumAllTable
	   ,
	   (
	   (SUM(t.value)*100)
	   /
	   SUM(SUM(t.value)) OVER ()
	   )[percent]
	   --,
       --SUM(t.value) * 100.0 / SUM(SUM(t.value)) OVER () AS Percentage
FROM @table t  
GROUP BY t.name