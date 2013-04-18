class HomeController < ApplicationController
  def index
    redirect_to thinker_path(current_thinker) if thinker_signed_in?
  end
end
