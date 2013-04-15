class Cognition < ActiveRecord::Base
  attr_accessible :cognition, :thinker_id, :type
end

class Factoid < Cognition
  belongs_to :thinker
end

class Epiphany < Cognition
  belongs_to :thinker
end

class BrainWave < Cognition
  belongs_to :thinker
end