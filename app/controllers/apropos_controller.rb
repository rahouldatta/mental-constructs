class AproposController < ApplicationController
  #before_filter :authenticate_thinker!

  layout 'apropos'

  def how_to_use

  end

  def about
    @feedback_count = Feedback.where(:thinker_id => current_thinker.id) rescue nil
  end

  def record_feedback
    Feedback.create(:thinker_id => current_thinker.id, :feedback => params[:feedback], :type_of_feedback => params[:type_of_feedback])
    redirect_to :back
  end

end
