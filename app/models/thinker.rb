require File.join(Rails.root, 'lib/engines/searcher.rb')
include Searcher

class Thinker < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :alias, :first_name, :last_name, :age, :gender, :last_brain_storm_session_id

  #======================= ASSOCIATIONS ========================
  has_many :factoids
  has_many :brain_wave
  has_many :epiphanies
  has_many :remembralls
  has_many :link_hoards
  has_many :constructs
  has_many :dossiers
  has_many :treatment_construct_dossiers
  has_many :brain_storm_sessions


  def to_param
    "#{self.alias}"
  end

  def pick_random_provocating_word
    arr = []
    3.times { arr << (PROVOCATIVE_WORDS[rand(PROVOCATIVE_WORDS.length)]).to_s.titleize }
    arr
  end

  #======================= CALLBACKS ========================
  before_create :parameterize_alias

  def parameterize_alias
    self.alias = self.alias.parameterize
  end

  def get_ordered_constructs(seq)
    if seq.eql? "Shared Constructs"
      return self.constructs.where(:share => true)
    elsif seq.eql? "StandAlone Constructs"
      return self.constructs.where(:dossier_id => nil)
    elsif seq.eql? "Constructs with mapped BrainStorm"
      a = []
      self.constructs.each {|c| a << c unless c.brain_storm_session.nil?}
      return a
    elsif seq.eql? "Constructs without mapped BrainStorm"
      a = []
      self.constructs.each {|c| a << c if c.brain_storm_session.nil?}
      return a
    else
      return self.constructs.order("#{seq.downcase.gsub(" ","_")} DESC")
    end
  end


  #========================== Search Methods ==========================
  SEARCH_IN_FEATURES = ["constructs","epiphanies","factoids",'brain_wave','brain_storm_sessions']

  def find_relevant_data(search_string)
    search_results = {}
    unless search_string.blank?
      SEARCH_IN_FEATURES.each do |k|
        eval "search_results[:#{k.pluralize}] = search_#{k}(self.#{k},search_string)"
      end
    end
    search_results
  end

  def search_constructs(constructs,search_string)
    found = []
    constructs.each do |construct|
      found << construct if exists_somewhere?(construct.construct,search_string) or exists_somewhere?(construct.title,search_string) or exists_somewhere?(construct.foot_notes,search_string)
    end
    found
  end

  def search_epiphanies(epiphanies,search_string)
    found = []
    epiphanies.each do |epiphany|
      found << epiphany if exists_somewhere?(epiphany.cognition,search_string)
    end
    found
  end

  def search_factoids(factoids,search_string)
    found = []
    factoids.each do |factoid|
      found << factoid if exists_somewhere?(factoid.cognition,search_string)
    end
    found
  end

  def search_brain_wave(brain_waves,search_string)
    found = []
    brain_waves.each do |brain_wave|
      found << brain_wave if exists_somewhere?(brain_wave.cognition,search_string)
    end
    found
  end

  def search_brain_storm_sessions(brain_storm_sessions,search_string)
    found = []
    brain_storm_sessions.each do |brain_storm_session|
      if exists_somewhere?(brain_storm_session.session_title,search_string)
        found << brain_storm_session
      else
        brain_storm_session.flashes.each do |flash|
          found << brain_storm_session if exists_somewhere?(flash.flash,search_string) or exists_somewhere?(flash.sub_points.to_s,search_string)
        end
      end
      end
    found
  end

end
