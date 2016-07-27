class ReceivedReceipt < ApplicationRecord
  belongs_to :contract
  validates :responsible, presence: true
end
