class Item

  ITEMS = %w[🍊 🍌 🔫 🎸 🍄 💰]

  def self.random_item_or_nothing
    if rand(1..100) <= 33
      ITEMS.sample
    end
  end
end
