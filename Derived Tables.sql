select * 
from	(select BusinessEntityId 
		from Person.Person
		) AS PersonInfo

select OrderYear, count(*) as OrderCount
from (select year(OrderDate) as OrderYear, year(ShipDate) as ShipYear
	  from Sales.SalesOrderHeader) as OrderDetails
	  where ShipYear = 2012
	  Group by OrderDetails.OrderYear
	  order by OrderYear

select * 
from(select BusinessEntityID, NationalIDNumber, year(BirthDate)as BirthYear,year(HireDate) as HireYear
	 from HumanResources.Employee) as EmployeeDetails
	 where BirthYear < 1960
	 order by BirthYear
--aliases created in subqueries can be referenced in outer queriesas seen above with HireYear and BirthYear
select * from Sales.SalesOrderHeader


select Query_Alias1.SalesYear, Query_ALias1.TotalRevenue, Query_Alias2.NewHireCount
from(
	 select SalesYear, sum(TotalDue) as TotalRevenue
	 from(
		  select year(OrderDate) as SalesYear, TotalDue
		  from Sales.SalesOrderHeader
		  ) as Inner_Query1
		  Group by SalesYear
		  )as Query_ALias1
left outer join(
select HireYear,  count(BusinessEntityID) as NewHireCount
from(
	 select year(HireDate) as HireYear, BusinessEntityID
	 from HumanResources.Employee
	 --group by year(HireDate)----------
	 ) as Inner_Query2
	 group by HireYear
	 )as Query_Alias2	 
	 on Query_ALias1.SalesYear = Query_Alias2.HireYear
	 order by Query_ALias1.SalesYear

select HireYear, count(*)
from (select year(HireDate) as HireYear
	  from HumanResources.Employee
	  ) as H
group by HireYear

--Exercises
select top 10 * 
from HumanResources.Employee

select *
from(
	 Select BusinessEntityID, year(HireDate) as HireYear, year(BirthDate) as BirthYear
	 from HumanResources.Employee
	 )as H 
	 where HireYear >= 2006
	 and BirthYear <= 1968 
	 order by BusinessEntityID

go

select top 2 * from Sales.SalesOrderHeader

select *
from(select SalesYear, sum(Totaldue) as YearlySales
	from
	(select SalesOrderID, year(OrderDate) as SalesYear, Totaldue
	 from Sales.SalesOrderHeader
	) as H
	 group by SalesYear
	 )as J
	 where SalesYear in (2011, 2012)
	 order by SalesYear
	 

	 
	