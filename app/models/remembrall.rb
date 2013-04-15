class Remembrall < ActiveRecord::Base
  attr_accessible :task, :thinker_id

  belongs_to :thinker
end
