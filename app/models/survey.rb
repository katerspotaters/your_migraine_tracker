class Survey < ActiveRecord::Base
  belongs_to :user
  belongs_to :migraine
end
