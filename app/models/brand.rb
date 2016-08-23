class Brand < ApplicationRecord
  has_many :vehicles, dependent: :destroy
end
