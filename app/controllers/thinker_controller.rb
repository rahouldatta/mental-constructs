class ThinkerController < ApplicationController
  before_filter :authenticate_thinker!
  before_filter :load

  layout 'thinker'

  def load
    @epiphanies = current_thinker.epiphanies.order("created_at DESC")
    @brainwaves = current_thinker.brain_wave.order("affinity_level DESC")
    @factoids = current_thinker.factoids.order("created_at DESC")
    @remembralls = current_thinker.remembralls
    @incomplete_tasks = @remembralls.where(:status => false)
    @link_hoards = current_thinker.link_hoards.group_by(&:category)
    @concepts = current_thinker.concepts.order("affinity_level DESC")
  end

  def show
    @thinker = current_thinker
    @concept = current_thinker.concepts.new
  end

  # =================== Cognition Methods =========================
  def delete_epiphany
    Epiphany.find(params[:id]).destroy unless params[:id].nil?
  end

  def delete_brainwave
    BrainWave.find(params[:id]).destroy unless params[:id].nil?
  end

  def delete_factoid
    Factoids.find(params[:id]).destroy unless params[:id].nil?
  end

  def delete_remembrall
    Remembrall.find(params[:id]).destroy unless params[:id].nil?
  end

  def mark_remembrall_as_complete
    r = Remembrall.find(params[:id])
    r.update_attributes(:status => true)
  end


  # =================== Cognition Record Methods =========================

  def record_epiphanies
    current_thinker.epiphanies.create(:cognition => params[:cognition])
  end

  def record_factoids
    current_thinker.factoids.create(:cognition => params[:cognition])
  end

  def record_brainwaves
    current_thinker.brain_wave.create(:cognition => params[:cognition],:affinity_level => params[:affinity_level])
  end

  def record_remembrall
    current_thinker.remembralls.create(:task => params[:task], :status => false)
  end

  # =================== WWW Search Methods =========================

  def google_search
    redirect_to "http://www.google.com/search?q=#{params[:google_search_parameter].strip.gsub(/\s+/,"+")}"
  end

  def wikipedia_search
    redirect_to "http://en.wikipedia.org/wiki/#{params[:wikipedia_search_parameter].strip.titleize.gsub(/\s+/,"_")}"
  end

  def bing_search
    redirect_to "http://www.bing.com/search?q=#{params[:bing_search_parameter].strip.gsub(/\s+/,"+")}"
  end

  def yahoo_search
    redirect_to "http://search.yahoo.com/search?p=#{params[:yahoo_search_parameter].strip.gsub(/\s+/,"+")}"
  end

   #====================== Miscelleneuos Methods ========================

  def record_link
    params[:new_category].blank? ? current_thinker.link_hoards.create(:description => params[:description],:link => params[:link], :category => params[:category])
      : current_thinker.link_hoards.create(:link => params[:link], :category => params[:new_category],:description => params[:description])
    @link_hoards = current_thinker.link_hoards.group_by(&:category)
  end

  def delete_link
    LinkHoard.find(params[:id]).destroy unless params[:id].nil?
    @link_hoards = LinkHoard.where(:thinker_id => current_thinker.id).group_by(&:category)
  end

end
