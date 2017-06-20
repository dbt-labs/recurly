select

    --ids
    uuid as id,
    nullif(account_href,'') as account_id,
    nullif(invoice_href,'')::integer as invoice_id,

    --dates
    nullif(activated_at,'')::timestamp as activated_at,
    nullif(canceled_at,'')::timestamp as canceled_at,
    nullif(current_period_started_at,'')::timestamp as current_period_started_at,
    nullif(current_period_ends_at,'')::timestamp as current_period_ends_at,
    nullif(expires_at,'')::timestamp as expires_at,
    trial_started_at::timestamp,
    trial_ends_at::timestamp,

    nullif(state,'') as state,
    nullif(collection_method,'') as collection_method,
    nullif(currency,'') as currency,
    nullif(customer_notes,'') as customer_notes,
    net_terms,
    nullif(plan__name,'') as plan_name,
    nullif(plan__plan_code,'') as plan_code,
    quantity,
    unit_amount_in_cents/100.0 as unit_amount,
    remaining_billing_cycles,
    total_billing_cycles,
    nullif(revenue_schedule_type,'') as revenue_schedule_type,
    nullif(terms_and_conditions,'') as terms_and_conditions,
    nullif(updated_at,'')::timestamp as updated_at

from
  {{var('subscriptions_table')}}
