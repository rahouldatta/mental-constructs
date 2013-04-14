class Thinker < ActiveRecord::Base

  def to_param
    "#{self.alias}"
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :alias, :first_name, :last_name, :age, :gender
  # attr_accessible :title, :body

  before_create :parameterize_alias

  def parameterize_alias
    self.alias = self.alias.parameterize
  end
end
