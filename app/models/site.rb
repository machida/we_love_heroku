class Site < ActiveRecord::Base
  validates_presence_of :name, :url, :creator
  validates_length_of :name, :minimum => 3, :maximum => 100
  validates_length_of :url, :minimum => 3, :maximum => 100
  validates_length_of :description, :minimum => 0, :maximum => 1000
  validates_length_of :creator, :minimum => 1, :maximum => 100
  validates_length_of :hash_tag, :minimum => 0, :maximum => 140
  validates_uniqueness_of :url
  validates_url_format_of :url
  validates_url_format_of :repository_url, :allow_nil => true, :allow_blank => true
  
  def hash_tags
    '#' + self.hash_tag.split(' ').join(' #')
  end
end
