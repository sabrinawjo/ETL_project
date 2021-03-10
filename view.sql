create view best_product_category AS
select product_category, count(*) from online 
group by product_category 
order by count(*) DESC
limit 10


create view product_stockcode_revenue AS
select o.product, o.revenue, k.stock_code
from online AS o 
inner join key_sku AS k
on o.product_sku = k.product_sku limit 10



drop table online