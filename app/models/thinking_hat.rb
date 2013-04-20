class ThinkingHat < ActiveRecord::Base
  attr_accessible :black_hat, :collective, :construct_id, :green_hat, :red_hat, :white_hat, :yellow_hat

  belongs_to :construct

  serialize :black_hat, Array
  serialize :white_hat, Array
  serialize :red_hat, Array
  serialize :green_hat, Array
  serialize :yellow_hat, Array
  serialize :collective, Hash

end
