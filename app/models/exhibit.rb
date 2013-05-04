require File.join(Rails.root, 'lib/engines/searcher.rb')
include Searcher

class Exhibit < ActiveRecord::Base
  attr_accessible :brain_storm, :construct, :foot_notes, :popularity_quotient, :thinker, :title

  serialize :brain_storm, Array

  before_create :treatment_exhibit

  def treatment_exhibit
    self.popularity_quotient = 0
  end

  def search_for_exhibits(search_string)
    found = []
    Exhibit.all.each do |exhibit|
      found << exhibit.id if exists_somewhere?(exhibit.construct,search_string) or exists_somewhere?(exhibit.title,search_string) or exists_somewhere?(exhibit.thinker,search_string)
    end
    found
  end

end
