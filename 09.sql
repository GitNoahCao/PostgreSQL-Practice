select ocust,max("period") 
 from (
	select "old order num",ocust,min("T-diff") "period"
	 from (
	 select o2.ordid "new order num",o1.ordid "old order num",o1.ocust,o2.odate-o1.odate "T-diff"
	 from customers c
	 join orders o1 on c.custid=o1.ocust
	 join orders o2 on o1.ocust=o2.ocust
	 where o1.ordid!=o2.ordid and o2.odate-o1.odate>=0
	 group by o2.ordid,o1.ordid
	 order by o1.odate,o2.odate) something
	 group by ocust,"old order num"
	 order by ocust,"old order num") result
 group by ocust
;