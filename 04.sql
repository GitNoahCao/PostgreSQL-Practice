select ptype,ocust from (select p.ptype,o.ocust,sum(d.qty), rank() over (partition by ptype 
order by case when sum(d.qty) isnull then 0 else sum(d.qty) end desc) as rnk 
from products p left join details d on d.pcode=p.pcode 
left join orders o on o.ordid= d.ordid 
group by p.ptype,o.ocust) as ok where rnk =1;