class ExhibitsController < ApplicationController
  before_filter :authenticate_thinker!

  layout 'exhibit'

  def index
    @exhibits = Exhibit.order("created_at desc").paginate(:page=>params[:page], :per_page=>13)
  end

  def show
    @exhibit = Exhibit.find(params[:id])
  end

  def search_exhibits
    puts params
    puts "==============="
  end

end
