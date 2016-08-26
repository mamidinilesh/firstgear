class RateCard < ApplicationRecord
  belongs_to :vehicle
  belongs_to :service
  belongs_to :vendor
end
