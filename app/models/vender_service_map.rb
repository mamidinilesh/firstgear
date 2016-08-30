class VenderServiceMap < ApplicationRecord
  belongs_to :vendor
  belongs_to :service
  belongs_to :vehicle
end
