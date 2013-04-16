class LinkHoard < ActiveRecord::Base
  attr_accessible :category, :link, :thinker_id

  belongs_to :thinker
end
