class Question < ActiveRecord::Base
  #relationships
  has_many :alternatives, dependent: :destroy
  #validation
  validates :topic, presence: true
  # Accepts nested attribute for alternatives
  accepts_nested_attributes_for :alternatives, :reject_if => :all_blank, :allow_destroy => true

  def normalized_votes_for(option)
    votes_summary == 0 ? 0 : (option.votes.count.to_f / votes_summary) * 100
  end

  def votes_summary
    alternatives.inject(0) {|summary, option| summary + option.votes.count}
  end
end
