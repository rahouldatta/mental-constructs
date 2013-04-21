class BrainStormSession < ActiveRecord::Base
  attr_accessible :construct_id

  belongs_to :construct
  has_many :flashes
end
