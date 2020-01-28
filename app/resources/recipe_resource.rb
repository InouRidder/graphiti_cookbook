class RecipeResource < ApplicationResource
  attribute :title, :string
  attribute :cooked, :boolean
  attribute :rating, :integer
  attribute :description, :string

  belongs_to :category, link: false

  def base_scope
    Recipe.order(created_at: :desc)
  end



end
