class InvoiceMailer < ApplicationMailer
  def send_email
    @invoice = params[:invoice]
    @recipients = @invoice.invoice_emails
    emails = @recipients.collect(&:email).join(",")

    attachments["invoice_#{@invoice.id}.pdf"] = GeneratePdfFromString.call(render_to_string(pdf: 'invoice', 
                                                  template: 'invoices/pdf.html.erb', layout: 'invoice_pdf'))

    mail(to: emails, subject: 'Invoice')
  end
end
