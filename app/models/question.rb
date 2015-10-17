class Question < ActiveRecord::Base
  #relationships
  has_many :alternatives, dependent: :destroy
  #validation
  validates :topic, presence: true
end
