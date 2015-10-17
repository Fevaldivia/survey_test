require 'rails_helper'

RSpec.describe Alternative, :type => :model do
    describe Alternative do
    it "is valid with a title" do
      alternative = Alternative.new(
        title: 'Horror movie?')
      expect(alternative).to be_valid
    end

    it "is invalid without a title" do
      alternative = Alternative.new(title: nil)
      alternative.valid?
      expect(alternative.errors[:title]).to include("can't be blank")
    end
  end
end
