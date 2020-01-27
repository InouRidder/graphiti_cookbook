class Recipe < ApplicationRecord
  CATEGORIES = %w[
    na breakfast brunch lunch dinner snacks appetisers soups salads
    sides pizza rice noodles pasta pies burgers mince sausages
    chicken turkey duck poultry pork lamb beef meat seafood stir-fry
    sauces vegetarian desserts baking drinks
  ].freeze

  validates :title, :description, presence: true
  validates :rating, numericality: {
    only_integer: true,
    less_than_or_equal_to: 100,
    greater_than_or_equal_to: 0
  }

  enum category: CATEGORIES, _scopes: false

  def cooked!
    return true if cooked?

    update(cooked: true)
  end
end
