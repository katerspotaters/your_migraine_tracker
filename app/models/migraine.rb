class Migraine < ActiveRecord::Base
  belongs_to :user
  has_many :surveys
end
