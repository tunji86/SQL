select ProductID, ListPrice,
case when ListPrice > 100 then 'Expensive'
	 else 'Inexpensive'
	end as ProductClass
from Production.Product
GO

select datediff(day,BirthDate, getDate()) as Age
from Sales.vPersonDemographics
go

with CTE_G
as(select P.BusinessEntityID as BEntity, P.FirstName as FName, P.LastName as LName,
	cast(coalesce(datediff(day, PD.BirthDate, getdate())/365.25,0) as int) as DD 
from Sales.vPersonDemographics PD
inner join Person.Person P
on P.BusinessEntityID = PD.BusinessEntityID
), CTE_Cast
as (select *, case when DD is null then 'Unknown Age'
				   when DD between 0 and 17 then 'Underage'
				   when DD between 18 and 25 then 'Under 25'
				   when DD between 26 and 34 then 'over 25'
				   when DD between 35 and 39 then 'Under 40'
				   when DD between 40 and 50 then 'Middle age'
				   when DD > 50 then 'Not young anymore' 
				   End as AgeClass
	from CTE_G
	), CTE_J
	as
	 (select  BEntity,AgeClass, count(AgeClass) as AgeCount
	  from CTE_Cast
	  group by AgeClass, BEntity
	) 

select cte1.FName, cte1.LName, cte3.AgeClass, cte3.AgeCount
from CTE_G cte1
inner join CTE_J cte3
on cte1.BEntity = cte3.BEntity
order by cte3.AgeClass

go

select PD.BusinessEntityID, P.LastName, P.FirstName,
case when PD.Gender = 'M' then 'Male'
	 when PD.Gender = 'F' then 'Female'
	 else 'Unknown Gender'
	End as GenderValue
from Sales.vPersonDemographics PD
inner join Person.Person P
on P.BusinessEntityID = PD.BusinessEntityID

select MIddlename,
	case when MiddleName is NUll then ''
	else MiddleName
   End as MiddleNameConf
from Person.Person

go

with CTE_A
as(select P.BusinessEntityID,
	   sum(SOH.TotalDue) as TotalSalesAmount
from Sales.SalesOrderHeader SOH
inner join Sales.Customer SC
on SC.CustomerID = SOH.CustomerID
inner join Person.Person P
on P.BusinessEntityID = SC.PersonID
group by P.BusinessEntityID
),CTE_B as
		 (select P.LastName+' '+P.FirstName as CustomerName,
		  case
				when cs.TotalSalesAmount between 0 and 149.99 then 'Under $150'
				when cs.TotalSalesAmount between 150 and 499.99 then '$150 - $499.99'
				when cs.TotalSalesAmount between 500 and 999.99 then '$500 - $999.99'
				when cs.TotalSalesAmount between 1000 and 4999.99 then '$1,000 - $4,999.99'
				when cs.TotalSalesAmount between 5000 and 14999.99 then '$5,000 - $14,999.99'
				Else 'Over $15,000'
				End as PriceRange
		  from CTE_A CS
		  inner join Person.Person P
		  on P.BusinessEntityID = CS.BusinessEntityID
		  )

select PriceRange, count(*) as CustomerRange
from CTE_B
group by PriceRange
order by 
		case
			when PriceRange = 'Under $150' then 1
			when PriceRange = '$150 - $499.99' then 2
			when PriceRange = '$500 - $999.99' then 3
			when PriceRange = '$1,000 - $4,999.99' then 4
			when PriceRange = '$5,000 - $14,999.99' then 5
			else 6
			end 

--EXERCISE
select LastName, FirstName,
case 
	when EmailPromotion = 0 then 'Promotion 1'
	when EmailPromotion = 1 then 'Promotion 2'
	when EmailPromotion = 2 then 'Promotion 3'
	else 'Undefined Promotion'
	End as PromotionCategory
from Person.Person

--The value of the ELSE value is returned if defined, if not it returns Null

select FirstName, len(FirstName) as FNameLength,
case 
	when len(FirstName) >= 10 then 'Long Name'
	when len(FirstName) < 10 then 'Short Name'	
	End as FirstNameCategory
from Person.Person

go

with CTE_A
as(select SalesOrderID, 
	case 
		when TotalDue between 0 and 149.99 then '$0 - $149.99'
		when TotalDue between 150 and 499.99 then '$150 - $499.99'
		when TotalDue between 500 and 4999.99 then '$500 - $4,999.99'
		when TotalDue between 5000 and 24999.99 then '$5000 - $24,999.99'
		when TotalDue > 25000 then 'Over $25,000'
		End as PriceCategory
from Sales.SalesOrderHeader
where SalesPersonID is not null
)

select PriceCategory, count(*) as CategoryCount
from CTE_A
group by PriceCategory
order by PriceCategory

go

select ProductID, coalesce(Color, 'No Color')
from Production.Product

go

select ProductID,
case
	when Color is null then 'No Color'
	else Color
	end as Color
from Production.Product
	
	


