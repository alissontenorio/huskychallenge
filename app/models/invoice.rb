class Invoice < ApplicationRecord
  has_many :invoice_emails
  accepts_nested_attributes_for :invoice_emails
  belongs_to :user
end
