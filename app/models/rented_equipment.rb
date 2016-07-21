class RentedEquipment < ApplicationRecord
  belongs_to :contract
  belongs_to :equipment
end
