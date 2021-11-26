class Invoices::DownloadsController < ApplicationController
  before_action :require_login
  before_action :set_invoice
  include InvoicesHelper

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: InvoicesHelper.invoice_filename(@invoice), template: 'invoices/pdf.html.erb',
               layout: 'invoice_pdf', locals: { invoice: @invoice }
      end
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:invoice_id])
  end
end
