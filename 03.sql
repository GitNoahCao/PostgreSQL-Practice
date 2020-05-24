Select ("Invoice_ID") from (select i.invid "Invoice_ID", cast (sum (d.qty*p.price)*1.2 as numeric (5,2)) - cast (avg(i.amount) as numeric (5,2))
invoices_amount from details d join products p on d.pcode = p.pcode join invoices i on i.ordid = d.ordid 
group by i.invid) as something 
where invoices_amount = 0 order by 1;