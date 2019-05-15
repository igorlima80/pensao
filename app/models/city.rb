class City < ApplicationRecord
  belongs_to :state
  has_many :properties
  has_many :guests

  def name_with_state
    "#{name} - #{state&.acronym}"
  end
end
