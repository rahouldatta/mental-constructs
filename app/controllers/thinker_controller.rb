class ThinkerController < ApplicationController
  before_filter :authenticate_thinker!
  before_filter :load

  layout 'thinker'

  def load
    @epiphanies = current_thinker.epiphanies
    @brainwaves = current_thinker.brain_wave.order("affinity_level DESC")
    @factoids = current_thinker.factoids
  end

  def show
    @thinker = current_thinker
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
    current_thinker.remembralls.create(:task => params[:task])
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


end
