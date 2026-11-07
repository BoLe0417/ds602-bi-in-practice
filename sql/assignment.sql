with analytics_customers as (
  select 
    distinct 
      t1.month,
      t1.customer_id
  from aws_usage t1
  inner join services t2
    on t1.service_id = t2.service_id
  where
    t1.month = date('2026-08-01')
    and t2.service_category = 'Analytics'
)

select
  t1.month,
  t2.customer_region as region,
  t2.customer_country as country,
  count(*) as customer_count
from analytics_customers t1
left outer join customers t2
  on t1.customer_id = t2.customer_id
group by
  t1.month,
  t2.customer_region,
  t2.customer_country
order by
  t2.customer_region,
  t2.customer_country