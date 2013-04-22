class Thinker < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :alias, :first_name, :last_name, :age, :gender

  #======================= ASSOCIATIONS ========================
  has_many :factoids
  has_many :brain_wave
  has_many :epiphanies
  has_many :remembralls
  has_many :link_hoards
  has_many :constructs
  has_many :dossiers
  has_many :treatment_construct_dossiers
  has_many :brain_storm_sessions

  def to_param
    "#{self.alias}"
  end
  #======================= CALLBACKS ========================
  before_create :parameterize_alias

  def parameterize_alias
    self.alias = self.alias.parameterize
  end

  def get_order_sequencing_type(seq)
    if seq.eql? "Shared Concepts"
      return "share"
    elsif seq.eql? "StandAlone Concepts"
      return "dossier_id"
    else
      return seq.downcase.gsub(" ","_")
    end
  end

end
