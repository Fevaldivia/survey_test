require 'rails_helper'

RSpec.describe Question, :type => :model do
  describe Question do
    it "is valid with a topic" do
      question = Question.new(
        topic: 'what kind of music do you like?')
      expect(question).to be_valid
    end

    it "is invalid without a topic" do
      question = Question.new(topic: nil)
      question.valid?
      expect(question.errors[:topic]).to include("can't be blank")
    end
  end
end
