class LinkHoard < ActiveRecord::Base
  attr_accessible :category, :link, :thinker_id, :description

  belongs_to :thinker

  before_create :treatment_link_category

  def treatment_link_category
    self.category = self.category.parameterize.strip.upcase.gsub(" ","_")
  end

  def correct_link
    if self.link.include? "http:" or self.link.include? "https:"
      return self.link
    else
      return "http://#{self.link}"
    end
  end

end
