class AproposController < ApplicationController
  before_filter :authenticate_thinker!

  layout 'apropos'

  def how_to_use

  end

  def about

  end

end
