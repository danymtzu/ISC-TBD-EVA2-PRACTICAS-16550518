# 1°
select a.customerid, sum(c.quantity*c.UnitPrice) as subtotal 
from customers a
inner join orders b on a.customerid=b.customerid
inner join order_details c on c.orderid=b.orderid
group by a.customerid
order by subtotal DESC limit 1;
# 2°
select a.customerid, sum(c.quantity*c.UnitPrice) as subtotal 
from customers a
inner join orders b on a.customerid=b.customerid
inner join order_details c on c.orderid=b.orderid
group by a.customerid
order by subtotal asc limit 1;
# 3°
select  a.productid, a.productname, max(b.quantity)
from products a
inner join order_details b on a.productid=b.productid
group by productid
order by quantity desc limit 1;
# 4°
select ProductID, productname, max(unitprice) as MAS_LUCRATIVO 
from products 
group by productid 
order by MAS_LUCRATIVO desc limit 1;
# 5°
select ProductID, productname, min(unitprice) as MENOS_LUCRATIVO 
from products 
group by productid 
order by MENOS_LUCRATIVO ASC LIMIT 3;
# 6°
select a.productid, a.productname, b.quantity from products a
inner join order_details b on b.productid = a.productid
inner join orders c on c.orderid = b.orderid
where c.customerid = (select a.customerid from customers a
inner join orders b on a.customerid = b.customerid
inner join order_details c on b.orderid = c.orderid	
group by a.customerid
order by  sum(c.unitprice * c.quantity) desc limit 1)
group by productid
order by quantity desc limit 1;
# 7°
select a.EmployeeID,  a.lastname, count(b.orderid) as num_ordenes from employees a
inner join orders b on a.employeeid = b.employeeid
group by employeeid
order by num_ordenes desc limit 1;
#8°
select a.EmployeeID,  a.lastname, count(b.orderid) as num_ordenes from employees a
inner join orders b on a.employeeid = b.employeeid
group by employeeid
order by num_ordenes asc limit 1;
# 9°
select a.supplierid, a.companyname, b.UnitsInStock, b.UnitsOnOrder from suppliers a
inner join products b on a.supplierid = b.supplierid
where b.unitsinstock = 0 and b.unitsonorder = 0;
# 10°
select a.supplierid, a.companyname, (b.UnitsOnOrder * b.unitprice) as num_compras from suppliers a
inner join products b on a.supplierid = b.supplierid
group by a.supplierid
order by num_compras desc limit 1;
