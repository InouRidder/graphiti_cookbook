class Recipe < ApplicationRecord
  validates :title, :description, presence: true
  validates :rating, numericality: {
    only_integer: true,
    less_than_or_equal_to: 100,
    greater_than_or_equal_to: 0
  }

  def cooked!
    return cooked? if cooked?

    update(cooked: true)
  end
end
