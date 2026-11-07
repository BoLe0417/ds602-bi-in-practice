with customer_usage as (
  select
    customer_id,
    sum(service_usage) as service_usage
  from aws_usage
  where month = date('2026-08-01')
  group by customer_id
)

select
  t1.customer_id,
  t2.customer_name,
  t2.customer_country as country,
  t2.customer_region as region,
  t1.service_usage,
  t3.manager_name
from customer_usage t1
left outer join customers t2
  on t1.customer_id = t2.customer_id
left outer join account_managers t3
  on t2.manager_id = t3.manager_id
where 
  t1.service_usage >= 80
  and t1.service_usage < 100
order by t1.service_usage desc
