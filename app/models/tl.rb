class Tl < ActiveRecord::Base
  attr_accessible :t, :i

  belongs_to :section
end
