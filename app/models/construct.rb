class Construct < ActiveRecord::Base
  attr_accessible :affinity_level, :construct, :dossier_id, :foot_notes, :share, :thinker_id, :title

  has_one :brain_storm_session
  belongs_to :thinker
  belongs_to :dossier
  before_create :treatment_construct

  def treatment_construct
    self.construct = self.construct.strip
    self.title = "Set Title" if self.title.nil? or self.title.blank?
    self.construct = "Build your Construct" if self.construct.nil? or self.construct.blank?
    self.exhibit_construct if self.share
  end

  def exhibit_construct
    Exhibit.create(:thinker => self.thinker.alias,
                   :title => self.title,
                   :construct => self.construct,
                   :foot_notes => self.foot_notes,
                   :brain_storm => treatment_brain_storm(self))
  end

  def treatment_brain_storm(construct)
    bs = construct.brain_storm_session
    if bs.nil?
      return nil
    else
      a,f = [],{}
      a << bs.session_title
      bs.flashes.each do |flash|
        f["#{flash.flash}"] = flash.sub_points
      end
      a << f
      return a
    end
  end

end


