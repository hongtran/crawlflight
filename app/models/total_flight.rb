class TotalFlight < ApplicationRecord
  belongs_to :route
  belongs_to :plane_category
end
