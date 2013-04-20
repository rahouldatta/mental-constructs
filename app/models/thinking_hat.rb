class ThinkingHat < ActiveRecord::Base
  attr_accessible :black_hat, :collective, :construct_id, :green_hat, :red_hat, :white_hat, :yellow_hat

  belongs_to :construct
end
