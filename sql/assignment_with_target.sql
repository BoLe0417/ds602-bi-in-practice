

with analytics_customers as (
  select 
    distinct
    t1.customer_id
  from aws_usage t1
  inner join services t2
    on t1.service_id = t2.service_id
  where
    t1.month = date('2026-08-01')
    and t2.service_category = 'Analytics'
),

country_actual as (
  select
    t2.customer_country as country,
    count(*) as company_count_actual
  from analytics_customers t1
  left outer join customers t2
    on t1.customer_id = t2.customer_id
  group by
    t2.customer_country
),

country_target as (
  select
    month,
    country,
    region,
    company_count as company_count_target
  from targets
  where
    target_id = 2
    and month = date('2026-08-01')
)

select
  t1.month,
  t1.region,
  t1.country,
  t1.company_count_target,
  coalesce(t2.company_count_actual, 0) as company_count_actual,
  case when coalesce(t2.company_count_actual, 0) >= t1.company_count_target
    then 'Ahead' else 'Missed' end as status
from country_target t1
left outer join country_actual t2
  on t1.country = t2.country
order by
  t1.month,
  t1.region,
  t1.country
