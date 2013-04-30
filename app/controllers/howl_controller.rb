class HowlController < ApplicationController

  layout 'howl'

  def index
    @howls = Howl.order("created_at DESC").limit(50)
  end

  def update_howl_display
    @howls = Howl.order("created_at DESC").limit(50)
  end

  def record_howl
    h = Howl.create(:howl => params[:howl])
    @howls = Howl.order("created_at DESC").limit(50)
  end

end
