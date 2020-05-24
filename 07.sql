select custid 
 from customers 
 where custid not in (
  select distinct o.ocust 
   from orders o 
   join details d on o.ordid=d.ordid 
   join products p on d.pcode=p.pcode 
   where o.odate>='2016-01-01' 
   and o.odate <= '2016-12-31' and p.ptype='BOOK');