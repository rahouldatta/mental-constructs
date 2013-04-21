class Construct < ActiveRecord::Base
  attr_accessible :affinity_level, :construct, :dossier_id, :foot_notes, :share, :thinker_id, :title

  has_one :thinking_hat
  belongs_to :thinker
  belongs_to :dossier
  before_create :treatment_construct

  def treatment_construct
    self.title = "Set Title" if self.title.nil? or self.title.blank?
    self.construct = "Build your Construct" if self.construct.nil? or self.construct.blank?
  end
end


