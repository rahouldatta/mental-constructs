class Flash < ActiveRecord::Base
  attr_accessible :brain_storm_session_id, :flash, :sub_points

  belongs_to :brain_storm_session
end
