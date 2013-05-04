class Bookmark < ActiveRecord::Base
  attr_accessible :brain_storm_title, :exhibit_id, :exhibit_thinker, :exhibit_title, :thinker_id

  belongs_to :thinker
end
