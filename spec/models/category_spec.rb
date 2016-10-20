require 'rails_helper'

describe Category, type: :model do

  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new()
        expect(category).to be_invalid
      end
      it "has unique titles" do
        category1 = Category.create(title: "Software")
        category2 = Category.new(title: "Software")
        expect(category2).to be_invalid
      end
    end

      context "valid attributes" do
        it "is valid with a title" do
          category = Category.create(title: "Software")
          expect(category).to be_valid
        end
      end

      describe "relationships" do
        it "has many jobs" do
          category = Category.new(title: "Software")
          expect(category).to respond_to(:jobs)
        end
      end

  end
end