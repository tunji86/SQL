--WINDOW FUNCTIONS TUTORIAL
--https://www.postgresql.org/docs/8.4/static/tutorial-window.html

select BusinessEntityID, TerritoryID, SUM(BONUS)
over (partition by BusinessEntityID order by TerritoryID)
from Sales.SalesPerson;


--MIN & MAX
select Max(bONUS) from Sales.SalesPerson
select Min(Bonus) from Sales.SalesPerson

SELECT COUNT(*) FROM Sales.SalesPerson

select * from Sales.SalesOrderHeader

select SalesPersonID, SalesOrderNUmber, sum(SubTotal) over(partition by SalesPersonID order by SalesOrderNumber DESC)
from Sales.SalesOrderHeader
where DueDate between '1/1/2012' and '12/31/2012'

select * from Production.Product

select Name, AVG(SafetyStockLevel) as [Avergae Stock],
count(*) as [Number of Products]
from Production.Product
Group by Name

Select ST.Name,P.LastName +''+ P.FirstName as [Sales Person], sum(TotalDue) as[Total Sales]
from Sales.SalesOrderHeader SOH
inner join Sales.SalesPerson SP
on SP.BusinessEntityID = SOH.SalesPersonID
inner join Person.Person P
on P.BusinessEntityID = SP.BusinessEntityID
inner join Sales.SalesTerritory ST
on SOH.TerritoryID = ST.TerritoryID
where SOH.OrderDate between '1/1/2012' and '12/31/2012'
Group by ST.Name, P.LastName +''+ P.FirstName
--order by P.LastName

select ST.Name, SOH.ModifiedDate,count(ST.Name) as [Territory Count], sum(SOH.Subtotal) as [Total Sales]
from Sales.SalesTerritory ST
inner join Sales.SalesOrderHeader SOH
on ST.TerritoryID = SOH.TerritoryID
where SOH.ModifiedDate between '1/1/2011' and '12/31/2012'
Group by ST.Name, SOH.ModifiedDate
having sum(SOH.Subtotal) > 4000 and count(ST.Name) >20
order by ST.Name, SOH.ModifiedDate

select sum(RevisionNumber) 
from Sales.SalesOrderHeader
group by SalesOrderID

select Department, count(*) as [No of Department]
from HumanResources.vEmployeeDepartment
group by Department
Having count(*) > 1
order by [No of Department]

select SalesPersonID, count(SalesOrderID) as [No of Sales], sum(TotalDue) as [Total]
from Sales.SalesOrderHeader
where OrderDate between '1/1/2012' and '12/31/2012' and SalesPersonID is not null
group by SalesPersonID
having sum(TotalDue) >= 20000
order by [No of Sales]


