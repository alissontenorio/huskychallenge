class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :number
      t.date :date
      t.string :company
      t.string :billed_to
      t.float :total_value

      t.timestamps
    end
  end
end
