class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, email: true, uniqueness: true
  before_create :setup_activation
  has_many :invoices

  def external?
    false
  end
end
