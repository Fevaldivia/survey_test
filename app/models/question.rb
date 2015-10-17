class Question < ActiveRecord::Base
  #relationships
  has_many :alternatives, dependent: :destroy
  #validation
  validates :topic, presence: true
  # Accepts nested attribute for alternatives
  accepts_nested_attributes_for :alternatives, :reject_if => :all_blank, :allow_destroy => true
end
