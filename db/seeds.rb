require 'csv'

# Seed Categories
CSV.foreach(Rails.root.join('db/seeds/categories.csv'), headers: true) do |row|
  Category.find_or_create_by(name: row['name'])
end

puts "Categories have been seeded successfully."

# Seed Accessories
CSV.foreach(Rails.root.join('db/seeds/accessories.csv'), headers: true) do |row|
  category = Category.find_by(name: row['category'])
  if category
    Accessory.create!(
      name: row['name'],
      description: row['description'],
      price: row['price'],
      category: category
    )
  else
    puts "Category not found for accessory #{row['name']}. Skipping accessory."
  end
end

puts "Accessories have been seeded successfully."

# Seed Products
CSV.foreach(Rails.root.join('db/seeds/products.csv'), headers: true) do |row|
  category = Category.find_by(name: row['category'])
  if category
    Product.create!(
      name: row['name'],
      description: row['description'],
      price: row['price'],
      quantity_available: row['quantity_available'],
      leftside_img: row['leftside_img'],
      rightside_img: row['rightside_img'],
      front_img: row['front_img'],
      back_img: row['back_img'],
      category: category
    )
  else
    puts "Category not found for product #{row['name']}. Skipping product."
  end
end

puts "Products have been seeded successfully."
