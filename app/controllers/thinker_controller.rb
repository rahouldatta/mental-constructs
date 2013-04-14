class ThinkerController < ApplicationController
  before_filter :authenticate_thinker!
  before_filter :load

  layout 'thinker'

  def load

  end

  def show
    @thinker = current_thinker
  end

end
