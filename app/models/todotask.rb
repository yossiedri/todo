class Todotask < ActiveRecord::Base
  attr_accessible :description, :duedate, :title
  validates :title  , :presence => true , :length => {:maximum => 50}

end
