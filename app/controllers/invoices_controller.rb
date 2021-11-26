class InvoicesController < ApplicationController
  before_action :require_login
  before_action :set_invoice, only: %i[ show edit update destroy send_email ]

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all.includes(:invoice_emails)
  end

  # GET /invoices/1 or /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @invoice.invoice_emails.build
  end

  # GET /invoices/1/send_email
  def send_email
    SendInvoiceEmailService.call(@invoice)
    respond_to do |format|
      format.html { redirect_to request.referer, notice: "Invoice was sent by email." }
      format.json { render :show, status: :created, location: @invoice }
    end
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user_id = current_user.id

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: "Invoice was successfully created." }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.includes(:invoice_emails).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:number, :date, :company, :billed_to, :total_value, invoice_emails_attributes:[:email])
    end
end
