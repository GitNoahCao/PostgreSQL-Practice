select c.country, count(case when o.odate <'2017-01-01'and o.odate >= '2016-01-01'then 1 else null end)
from customers c left join orders o on o.ocust = c.custid
group by c.country;