class Flash < ActiveRecord::Base
  attr_accessible :brain_storm_session_id, :flash, :sub_points

  serialize :sub_points, Array
  belongs_to :brain_storm_session
end
