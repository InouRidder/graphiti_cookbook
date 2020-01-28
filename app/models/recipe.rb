class Recipe < ApplicationRecord
  BASE_CATEGORIES = %w[
    na breakfast brunch lunch dinner snacks appetisers soups salads
    sides pizza rice noodles pasta pies burgers mince sausages
    chicken turkey duck poultry pork lamb beef meat seafood stir-fry
    sauces vegetarian desserts baking drinks
  ].freeze

  belongs_to :category, optional: true

  validates :title, :description, presence: true
  validates :rating, numericality: {
    only_integer: true,
    less_than_or_equal_to: 100,
    greater_than_or_equal_to: 0
  }

  TEXT_QUERY = "recipes.title @@ :query OR recipes.description @@ :query OR categories.name @@ :query"

  scope :search_by_text, ->(query) { joins(:category).where(TEXT_QUERY, query: query) }


  def cooked!
    return true if cooked?

    update(cooked: true)
  end
end
