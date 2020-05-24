select p.ptype,cast (cast (sum(d.qty) as numeric) / cast (count(distinct d.ordid) as numeric ) 
	as numeric (5,2)) 
from details d join products p on d.pcode=p.pcode 
group by p.ptype 
order by 1,2;