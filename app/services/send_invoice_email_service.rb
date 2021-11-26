class SendInvoiceEmailService
  def self.call(invoice)
    InvoiceMailer.with(invoice: invoice).send_email.deliver_later
  end
end
