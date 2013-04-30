class Howl < ActiveRecord::Base
  attr_accessible :howl, :mind_set

  before_create :set_mind_set

  def set_mind_set
    self.mind_set = HOWLER_TYPES.sample
    Howl.first.destroy if Howl.count > 53
  end

end
