class Construct < ActiveRecord::Base
  attr_accessible :affinity_level, :construct, :dossier_id, :foot_notes, :share, :thinker_id, :title

  belongs_to :thinker
  belongs_to :dossier
end
