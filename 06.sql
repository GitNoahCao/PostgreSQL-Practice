select p.ptype,count(distinct d.ordid) 
 from products p 
 join details d 
 on d.pcode=p.pcode 
 where d.ordid in 
  (select ordid 
   from (
    select d.ordid, count(distinct p.ptype) "single" 
     from details d 
     join products p 
     on p.pcode=d.pcode 
     group by d.ordid) as result
   where single=1)
 group by p.ptype;