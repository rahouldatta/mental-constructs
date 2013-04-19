class Dossier < ActiveRecord::Base
  attr_accessible :dossier_name, :dossier_quality, :thinker_id, :type

  has_many :concepts
  belongs_to :thinker

  before_create :treatment_dossier

  def treatment_dossier
    self.dossier_name = self.dossier_name.parameterize.strip.upcase.gsub(" ","_")
    self.dossier_quality = 3
  end
end
