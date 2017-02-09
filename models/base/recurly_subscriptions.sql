select

  --ids
  uuid,
  plan__plan_code,
  pending_subscription__plan__plan_code as pending_subscription_plan_code,


  --dates
  activated_at__inst,
  activated_at__string,
  canceled_at__inst,
  canceled_at__string,



  currency,
  unit_amount_in_cents,
  current_period_ends_at__inst,
  current_period_ends_at__string,
  current_period_started_at__inst,
  current_period_started_at__string,
  expires_at__inst,
  expires_at__string,
  invoice_href,
  net_terms,
  pending_subscription__quantity,
  pending_subscription__unit_amount_in_cents,
  quantity,
  remaining_billing_cycles,
  revenue_schedule_type,
  state,
  total_billing_cycles,
  trial_ends_at__inst,
  trial_ends_at__string,
  trial_started_at__inst,
  trial_started_at__string,



  coalesce(updated_at__inst::timestamp, updated_at__string::timestamp) as updated_at

from
  {{var('subscriptions_table')}}
