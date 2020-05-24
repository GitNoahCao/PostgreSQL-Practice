select ocust
	from(
		select "old order num",ocust,min("T-diff") "T diff bwt ord"
			from (
				select o2.ordid "new order num",o1.ordid "old order num",o1.ocust,o2.odate,cast (o2.odate-o1.odate as integer) "T-diff"
					from (
						select min(ordid) ordid,odate,ocust
						 from orders
						 group by odate,ocust) o1 
					join (
						select min(ordid) ordid,odate,ocust
						 from orders
						 group by odate,ocust) o2 on o1.ocust=o2.ocust
					where o1.ordid!=o2.ordid and o2.odate-o1.odate>=0
					group by o2.ordid,o1.ordid,o2.odate,"T-diff",o1.ocust
					--having count(o2.ordid)>5
					) something
			where "T-diff"!=0
			group by ocust,"old order num"
			order by ocust,"old order num") result
	group by ocust
	having avg("T diff bwt ord")<30
;