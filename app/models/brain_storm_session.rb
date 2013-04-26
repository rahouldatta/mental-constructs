class BrainStormSession < ActiveRecord::Base
  attr_accessible :construct_id, :thinker_id, :session_title

  belongs_to :construct
  has_many :flashes , :dependent => :destroy
  belongs_to :thinker

  before_create :treatment_session

  def treatment_session
    self.session_title = self.session_title.strip.titleize
  end

end
