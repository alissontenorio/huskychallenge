module InvoicesHelper
  def self.invoice_filename(invoice)
    "Invoice #{invoice.id}.pdf"
  end
end
