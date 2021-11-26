json.extract! invoice, :id, :number, :date, :company, :billed_to, :total_value, :emails, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
