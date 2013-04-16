class Remembrall < ActiveRecord::Base
  attr_accessible :task, :thinker_id, :status

  belongs_to :thinker

end
