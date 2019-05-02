--INBUILT FUNCTIONSS IN MS SQL INCLUDE STRING, INTEGER AND OTHER ADVANCED FUNCTIONS
--BELOW WE LOOK AT SOME

--LEFT FUNCTION
select Left(LastName,4) 
from Person.Person
where LastName is not null

--RIGHT Function
select Right(LastName,4) 
from Person.Person
where LastName is not null

--SUBSTRING Function
select LastName, Substring(LastName,3,4) as [3rd to 7th strings]
from Person.Person
where LastName is not null

--CHARINDEX Function
select LastName, charindex('b',LastName,2) as [Position of 2nd B]
from Person.Person
where LastName is not null
--Above is searching for the first 'b', starting from the 2nd string. The 2 is optional,
-- meaning it can start it's search from the first character by default

--LTRIM and RTRIM. They remove empty spaces from the right and left of texts respectively
select LTRIM('  Two spaces on the left') 
Select RTRIM('Two spaces on the right  ')

--UPPER and LOWER
select Upper(LastName),lower(Firstname) 
from Person.Person
where LastName is not null

--LEN
select LastName, LEN(LastName) as [String Length]
from Person.Person
where LastName is not null
order by [String Length]

select len(ltrim('    My name is')) as [Strimmed Length]

select replace(upper(substring(Name,3,7)),'E','s')
from Production.Product

--EXERCISE
SELECT LEFT('THIS IS A BASIC STRING',8)
SELECT RIGHT('THIS IS ANOTHER STRING',8)
SELECT Name, CHARINDEX('e',Name)
from Production.Product
select Name, substring(Name, 3,4)
from Sales.SalesTerritory
select left(right('This is a slightly longer string',8),4)
select Firstname,left(FirstName, charindex('e',Firstname,0)) 
from Person.Person
where charindex('e', Firstname) >0

--DATE & TIME FUNCTIONS
--getdate(), sysdatetime()
SELECT getdate(), Firstname
from Person.Person

--datediff
select datediff(yy, '01/12/1991','01/01/1999')
select datediff(mm, '01/12/1991','01/01/1999')
select datediff(dd, '01/12/1991','01/01/1999')
select datediff(hh, '01/12/1991 13:20:55','01/01/1999 00:55:23')
select datediff(SECOND, '01/12/1991 13:20:55','01/01/1999 00:55:23')
select datediff(dd,  '05/05/1986', getdate())

--dateadd
select dateadd(day, -300, getdate())
select dateadd(day, 25, '03/15/1981')
select dateadd(WEEK, 25, '03/15/1981')

--NULL FUNCTIONS

--coalesce. If expression on left is null, then it will be replaced by expression on right. 
select Firstname, coalesce(Middlename, '') as [Middlename], Lastname
from Person.Person

--nullif. It returns NULL if both expressions are equal and returns the first expression if they are not equal
select BillToAddressID, ShipToAddressID, coalesce(nullif(BillToAddressID, ShipToAddressID),'1')
from Sales.SalesOrderHeader

--NULL Functions excercise
select coalesce(Title, 'No Title Listed') as [Title], Firstname, coalesce(Middlename, 'No Middle Name') as [Middlename],Lastname
from Person.Person

select coalesce(Firstname+' '+Middlename+' '+Lastname, Firstname+' '+Lastname) as [Full Name]--coalesce applies to multiple columns too if one of them is null.
from Person.Person

select nullif(MakeFlag,FinishedGoodsFlag) as [Flag]
from Production.Product





