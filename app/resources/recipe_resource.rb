class RecipeResource < ApplicationResource
  attribute :title, :string
  attribute :cooked, :boolean
  attribute :rating, :integer
  attribute :description, :string
  attribute :category, :string
end
