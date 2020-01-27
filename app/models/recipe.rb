class Recipe < ApplicationRecord
  def cooked!
    return cooked? if cooked?

    update(cooked: true)
  end
end
