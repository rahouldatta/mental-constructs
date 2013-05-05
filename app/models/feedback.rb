class Feedback < ActiveRecord::Base
  attr_accessible :feedback, :thinker_id, :type_of_feedback
end
