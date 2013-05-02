class Exhibit < ActiveRecord::Base
  attr_accessible :brain_storm, :construct, :foot_notes, :popularity_quotient, :thinker_id, :title

  serialize :brain_storm

  belongs_to :thinker

  after_create :set_brain_storm_if_present

  def set_brain_storm_if_present

  end
end
