class Setting < ApplicationRecord
  has_many :reserves

  validates :percentage_of_administration, :percentage_of_franchisee, 
    :percentage_of_property, :max_of_installments, :days_for_reserve_refund,
    :days_of_ticket_validity, :card_cost_percentage, :percentage_of_installments,
    :max_of_installments_without_percentage, presence: true
end
