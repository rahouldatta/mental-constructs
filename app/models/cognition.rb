class Cognition < ActiveRecord::Base
  attr_accessible :cognition, :thinker_id, :type, :affinity_level, :share

  after_create :exhibit_cognition

  def exhibit_cognition
    if self.share
      Exhibit.create(:cognition => self.cognition,
                     :type_of_cognition => self.class.to_s,
                     :thinker => self.thinker.alias)
    end
  end

end