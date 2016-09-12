class City < ApplicationRecord
  belongs_to :state
  has_many :vendor
  has_many :regions


  
end
