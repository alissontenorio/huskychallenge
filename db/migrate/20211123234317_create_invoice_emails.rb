class CreateInvoiceEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_emails do |t|
      t.string :email
      t.references :invoice

      t.timestamps
    end
  end
end
