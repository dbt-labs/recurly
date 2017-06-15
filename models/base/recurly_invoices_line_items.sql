select

    --ids
    adjustment__uuid as id,
    nullif(adjustment__original_adjustment_uuid,'') as original_adjustment_id,
    coalesce(adjustment__invoice_href::bigint,_sdc_source_key_invoice_number)
        as invoice_id,
    nullif(adjustment__subscription_href,'') as subscription_id,
    nullif(adjustment__account_href,'') as account_id,

    --dates
    nullif(adjustment__created_at,'')::timestamp as created_at,
    nullif(adjustment__start_date,'')::timestamp as start_date,
    nullif(adjustment__end_date,'')::timestamp as end_date,

    nullif(adjustment__state,'') as state,
    adjustment__total_in_cents/100.0 as total,
    adjustment__unit_amount_in_cents/100.0 as unit_amount,
    adjustment__tax_in_cents/100.0 as tax,
    adjustment__taxable as is_taxable,
    adjustment__discount_in_cents/100.0 as discount,
    nullif(adjustment__origin,'') as origin,
    nullif(adjustment__description,'') as description,
    nullif(adjustment__currency,'') as currency,
    nullif(adjustment__product_code,'') as plan_code,
    adjustment__quantity as quantity,
    adjustment__quantity_remaining as quantity_remaining,
    nullif(adjustment__revenue_schedule_type,'') as revenue_schedule_type,
    nullif(adjustment__updated_at,'')::timestamp as updated_at

from
    {{var('invoices_line_items_table')}}
