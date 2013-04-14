class ThinkerController < ApplicationController
  before_filter :authenticate_thinker!

  def show
    @thinker=Thinker.find_by_alias(params[:id])
  end

end
