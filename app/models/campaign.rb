class Campaign < ActiveRecord::Base
  has_many :encounters
  belongs_to :user
end
