class Campany < ApplicationRecord
  has_many :employees
  has_one :president
end
