class Exhibit < ActiveRecord::Base
  attr_accessible :brain_storm, :construct, :foot_notes, :popularity_quotient, :thinker, :title

  serialize :brain_storm, Array

  before_create :treatment_exhibit

  def treatment_exhibit
    self.popularity_quotient = 0
  end

end
