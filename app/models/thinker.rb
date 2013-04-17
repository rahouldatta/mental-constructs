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

  def to_param
    "#{self.alias}"
  end
  #======================= CALLBACKS ========================
  before_create :parameterize_alias

  def parameterize_alias
    self.alias = self.alias.parameterize
  end
end
