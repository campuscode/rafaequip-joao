class Price < ApplicationRecord
  belongs_to :equipment
  belongs_to :rental_period
end
