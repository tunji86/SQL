select P.LastName, P.FirstName, E.EmailAddress
from Person.Person P Inner Join Person.EmailAddress E
on P.BusinessEntityID = E.BusinessEntityID
order by P.LastName


select *
from Production.ProductSubcategory

select * 
from Production.Product
 
select P.Name, PSC.ProductCategoryID, PSC.Name
from Production.Product P
right outer join  Production.ProductSubcategory PSC
on P.ProductSubcategoryID = PSC.ProductCategoryID 


--LOJ & ROJ ASSIGNMENT SOLUTIONS
select SP.BusinessEntityID, SP.SalesYTD, ST.Name as [Territory Name], P.LastName, P.FirstName
from Sales.SalesPerson SP
left outer join Sales.SalesTerritory ST
on SP.TerritoryID = ST.TerritoryID
left outer join Person.Person P
on SP.BusinessEntityID = P.BusinessEntityID
where ST.Name in ('Northeast','Central')

select * from Production.Product
select * from Production.ProductCategory

Select P.Name as [Product Name], P.ListPrice, PSC.Name as [ProductSubCategory Name],
PC.Name as [ProductCategory Name]
from Production.Product P 
left outer join Production.ProductSubcategory PSC
on P.ProductSubcategoryID = PSC.ProductSubcategoryID
left outer join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID
order by [ProductCategory Name] desc, [ProductSubCategory Name]





