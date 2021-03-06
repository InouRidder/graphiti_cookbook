require 'rails_helper'

RSpec.describe "recipes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/recipes/#{recipe.id}", payload
  end

  describe 'basic update' do
    let!(:recipe) { create(:recipe) }

    let(:payload) do
      {
        data: {
          id: recipe.id.to_s,
          type: 'recipes',
          attributes: {
            title: 'Updated title',
            description: 'Updated description',
            cooked: true
          }
        }
      }
    end


    it 'updates the resource' do
      expect(RecipeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { recipe.reload.attributes }
    end
  end
end
