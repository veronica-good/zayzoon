class Employee < ApplicationRecord
  belongs_to :employer
  has_many :earnings
end
