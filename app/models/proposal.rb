class Proposal < ApplicationRecord
  validates :name, :email, :phone, :description, presence: true
end
