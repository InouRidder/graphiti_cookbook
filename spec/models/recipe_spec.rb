require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) { build(:recipe) }

  let(:test_rating) {
    ->(attributes) {
      recipe.update(attributes)
      expect(recipe.errors.keys).to include(:rating)
    }
  }

  describe '.search_by_text' do
    it 'should return recipes of which the title or description match the text' do
      recipe = create(:recipe, title: 'taco', category: create(:category, name: 'mexican'))

      expect(Recipe.search_by_text('taco')).to include(recipe)
    end

    it 'should return recipes whose category match the query' do
      recipe = create(:recipe, title: 'taco', category: create(:category, name: 'mexican'))

      expect(Recipe.search_by_text('mexican')).to include(recipe)
    end

    it 'should not return recipes that do not match the query' do
      recipe = create(:recipe, title: 'taco', category: create(:category, name: 'mexican'))

      expect(Recipe.search_by_text('lentils')).not_to include(recipe)
    end
  end

  describe '#cooked!' do
    it 'should update the cooked status' do
      recipe.cooked!
      expect(recipe.cooked?).to be_truthy
    end
  end

  describe '#cooked?' do
    it 'should return the cooked status as boolean' do
      expect(recipe.cooked?).to be_in([true, false])
    end
  end

  describe '#rating' do
    it 'cannot be over 100' do
      test_rating.call(rating: 101)
    end

    it 'should be an integer' do
      test_rating.call(rating: "NR")
    end

    it 'must be over 0' do
      test_rating.call(rating: -1)
    end
  end
end
