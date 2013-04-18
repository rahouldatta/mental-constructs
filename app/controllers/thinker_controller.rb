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
    @concept_dossiers = current_thinker.treatment_concept_dossiers.order("dossier_quality DESC")
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

   #====================== Link Methods ========================

  def record_link
    params[:new_category].blank? ? current_thinker.link_hoards.create(:description => params[:description],:link => params[:link], :category => params[:category])
      : current_thinker.link_hoards.create(:link => params[:link], :category => params[:new_category],:description => params[:description])
    @link_hoards = current_thinker.link_hoards.group_by(&:category)
  end

  def delete_link
    LinkHoard.find(params[:id]).destroy unless params[:id].nil?
    @link_hoards = LinkHoard.where(:thinker_id => current_thinker.id).group_by(&:category)
  end

  #====================== Concept Methods ========================

  def delete_concept
    Concept.find(params[:id]).destroy
    #@concepts = current_thinker.concepts.order("affinity_level DESC")
  end

  def decide_concepts_display_order
    unless params[:sequencing_type].blank?
      order_seq = current_thinker.get_order_sequencing_type(params[:sequencing_type])
      @concepts = current_thinker.concepts.order("#{order_seq} DESC")
      session[:sequencing_type] = params[:sequencing_type]
    end
  end

  def add_concept_dossier
    concept_dossiers = current_thinker.treatment_concept_dossiers
    concept_dossiers.create(:dossier_name => params[:dossier_name]) if concept_dossiers.where(:dossier_name => params[:dossier_name].parameterize.strip.upcase.gsub(" ","_")).blank?
    redirect_to :back
  end

  def delete_dossier
    current_thinker.constructs.find_all_by_dossier_id(params[:id]).each do |c|
      c.update_attributes(:dossier_id => nil)
    end
    Dossier.find(params[:id]).destroy
    redirect_to :back
  end

end
