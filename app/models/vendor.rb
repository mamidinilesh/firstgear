class Vendor < ApplicationRecord
  belongs_to :region
  belongs_to :city
  belongs_to :state
  belongs_to :vendor_type
end
