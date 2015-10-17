class Alternative < ActiveRecord::Base
  belongs_to :question

  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :title, presence: true
end
