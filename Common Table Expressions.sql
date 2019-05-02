with CTE_Name
as(
	select  SalesOrderID, year(OrderDate) as OrderYear
	from Sales.SalesOrderHeader
   )

select OrderYear, count(*) as YearCount
from CTE_Name
where OrderYear = 2012
group by OrderYear

go

with HR_Emp
as(select BusinessEntityID, NationalIDNUmber, year(BirthDate) as BirthYear,
   year(HireDate) as HireYear
   from HumanResources.Employee
   )

   select BusinessEntityID, count(NationalIDNumber) as NationalIDCount
   from HR_Emp 
   group by BUsinessEntityID

go

--FROM THIS
SELECT SalesCurrentYear.SalesYear,
	   SalesCurrentYear.TotalSales,
	   SalesPriorYear.TotalSales
FROM(select year(OrderDate) as SalesYear, sum(TotalDue) as TotalSales
	 from Sales.SalesOrderHeader
	 group by year(OrderDate)
	 )as SalesCurrentYear
	 left outer join
	 ( select year(OrderDate) as SalesYear, sum(TotalDue) as TotalSales
	 from Sales.SalesOrderHeader
	 group by year(OrderDate)
	 )as SalesPriorYear
	 on SalesCurrentYear.SalesYear-1 = SalesPriorYear.SalesYear
	 order by 1
go

with CTE_Sales
as(select year(OrderDate) as SalesYear, sum(TotalDue) as TotalSales
	 from Sales.SalesOrderHeader
	 group by year(OrderDate)
	 )
	 
select CurrentYear.SalesYear, CurrentYear.TotalSales as CurrentYearSales, PriorYear.TotalSales as PreviousYearSales
from CTE_Sales as CurrentYear
left outer join CTE_Sales as PriorYear
on CurrentYear.SalesYear-1 = PriorYear.SalesYear

go

with s1
as(select year(OrderDate) as SalesYear, SalesOrderID, TotalDue
   from Sales.SalesOrderHeader
   ),
   s2 as
   (select SalesYear, count(SalesOrderID) as SalesCount, sum(TotalDue) as AnnualSales
    from s1
	group by SalesYear
	)

select SalesYear, SalesCount, AnnualSales
from s2
where SalesCount > 5000
order by 1

go

select top 2 * from HumanResources.Employee
go
--Exercises

with CTE_H
as(select year(HireDate) as HireYear, count(NationalIDNumber) as EmployeeCount
	from HumanResources.Employee
	group by year(HireDate)
	)

select CurrentYear.HireYear, CurrentYear.EmployeeCount, Previousyear.EmployeeCount
from CTE_H CurrentYear
left outer join CTE_H Previousyear
on CurrentYear.HireYear - 1 = Previousyear.HireYear
where CurrentYear.EmployeeCount > 0

go

with CTE_A
as(select year(SellStartDate) as StartYear, ProductID
	from Production.Product
	),CTE_B as
	(select StartYear, count(ProductID) as ProductCount
	 from CTE_A
	 group by StartYear
	 )

select * from CTE_B
go

with CTE_F
as(select month(OrderDate) as OrderMonth, year(OrderDate) as OrderYear, TotalDue
	from Sales.SalesOrderHeader
	)

select OrderMonth, sum(TotalDue) as MonthlyDue
from CTE_F
where OrderYear = 2012
group by OrderMonth
order by OrderMonth







