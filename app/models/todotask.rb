class Todotask < ActiveRecord::Base
  attr_accessible :description, :duedate, :title
end
