require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) { build(:recipe) }

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
end
