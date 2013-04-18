class Concept < ActiveRecord::Base
  attr_accessible :affinity_level, :concept, :dossier_id, :foot_notes, :share, :thinker_id, :title

  belongs_to :thinker
  belongs_to :dossier
end
