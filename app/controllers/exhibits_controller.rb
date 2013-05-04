class ExhibitsController < ApplicationController
  before_filter :authenticate_thinker!

  layout 'exhibit'

  def index
  #  @exhibits = Exhibit.order("created_at desc").paginate(:page=>params[:page], :per_page=>13)
  #end
  if session[:specific_thinker].nil? and session[:exhibit_search_results].nil?
    @exhibits = Exhibit.order("created_at desc").paginate(:page=>params[:page], :per_page=>13)
  elsif !session[:exhibit_search_results].nil? and session[:specific_thinker].nil?
    search_preparation
  else
    @exhibits = Exhibit.where(:thinker => session[:specific_thinker]).order("created_at desc").paginate(:page=>params[:page], :per_page=>13)
    @thinker = session[:specific_thinker]
    session[:specific_thinker] = nil
  end
end

def search_preparation
  @exhibits = []
  if session[:exhibit_search_results] == "Nothing Found"
    @search_result = 0
  else
    session[:exhibit_search_results].each {|id| @exhibits << Exhibit.find(id)}
    @search_result = @exhibits.count
  end
  session[:exhibit_search_results] = nil
end

  def show
    @exhibit = Exhibit.find(params[:id])
    @exhibit.brain_storm
    puts "======================"
  end

  def search_exhibits
    search_results = Exhibit.new.search_for_exhibits(params[:search_parameter])
    session[:search_parameter] = params[:search_parameter]
    search_results.blank? ? session[:exhibit_search_results] = "Nothing Found" : session[:exhibit_search_results] = search_results
    redirect_to exhibits_path
  end

end
