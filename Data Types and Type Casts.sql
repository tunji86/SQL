--CAST and CONVERT. They operate similarly but have different limitations depending on data types.
select Firstname, Lastname, cast(ModifiedDate as Date) as [Casted Date]
from Person.Person

select FirstName, Lastname, convert(Date, Modifieddate) as [Converted Date]
from Person.Person

select cast(Firstname as VARCHAR) as [Casted FirstName]
from Person.Person
select 11/4, cast(11 as float)/cast(4 as float),11.0/4.0
select cast(Firstname as varchar(3))
from Person.Person
select cast(Size as int)
from Production.Product
where ISNUMERIC(Size)=1

select *
from
	(select BusinessEntityID, FirstName, LastName
	 from Person.Person P
	 ) as PersonName
	  where PersonName.BusinessEntityID < 200

select year(orderDate) as OrderYear,count(*) as SalesCount
from Sales.SalesOrderHeader
where year(OrderDate) = '2012'
group by year(OrderDate)
Order by SalesCount

--An advantage of derived tables as seen below is that
--aliases created in sub-queries can be used in outer queries
select OrderYear, count(*) as SalesCount
from (select year(OrderDate) as OrderYear
	  from Sales.SalesOrderHeader) as SalesDetails
where OrderYear = 2012--between '01/01/2012' and '12/31/2012' and Isdate(OrderYear)=1
Group by OrderYear

select *
from (select BusinessEntityID, NationalIDNumber, year(BirthDate) as BirthYear, year(HireDate) as HireYear
	  from HumanResources.Employee) as myEmployee
	  where BirthYear < 1960
	  order by BirthYear
	


select * from HumanResources.Employee


select SalesPersonID,cast(cast(TaxAmt as float)/cast(SubTotal as float)*100 as float) as [Tax Percentage]
from Sales.SalesOrderHeader


