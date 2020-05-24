select c.custid,case when sum(d.qty*p.price) is null 
 then cast(0 as numeric(5,2)) else sum(d.qty*p.price) end "amount"
	from customers c
	left join orders o on c.custid=o.ocust
	left join details d on o.ordid=d.ordid
	left join products p on d.pcode=p.pcode
	where o.odate<'2016-07-01' and o.odate >'2015-12-31' 
	and p.ptype='MUSIC' or p.ptype is null
	group by c.custid
	having sum(d.qty*p.price)<50 or sum(d.qty*p.price) is null
	order by 1;