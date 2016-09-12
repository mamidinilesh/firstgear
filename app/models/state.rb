class State < ApplicationRecord
  has_many :cities
  has_many :vendors
end
