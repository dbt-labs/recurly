select

    --ids
    invoice_number::bigint as id,
    nullif(subscription_href,'') as subscription_id,
    nullif(account_href,'') as account_id,

    --dates
    nullif(created_at,'')::timestamp as created_at,
    nullif(closed_at,'')::timestamp as closed_at,

    nullif(state,'') as state,
    nullif(collection_method,'') as collection_method,
    nullif(currency,'') as currency,
    net_terms::integer,
    subtotal_in_cents/100.0 as subtotal,
    tax_in_cents/100.0 as tax,
    amount_remaining_in_cents/100.0 as amount_remaining,
    total_in_cents/100.0 as total,
    nullif(vat_number,'') as vat_number,
    nullif(customer_notes,'') as customer_notes,
    nullif(terms_and_conditions,'') as terms_and_conditions,
    nullif(updated_at,'')::timestamp as updated_at
from
    {{var('invoices_table')}}
