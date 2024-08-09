require "csv"

# Province taxing

Tax.create(region: "AB", gst_rate: 5.00, pst_rate: 0.00, hst_rate: 0.00)
Tax.create(region: "BC", gst_rate: 5.00, pst_rate: 7.00, hst_rate: 0.00)
Tax.create(region: "MB", gst_rate: 5.00, pst_rate: 7.00, hst_rate: 0.00)
Tax.create(region: "NB", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 15.00)
Tax.create(region: "NL", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 15.00)
Tax.create(region: "NT", gst_rate: 5.00, pst_rate: 0.00, hst_rate: 0.00)
Tax.create(region: "NS", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 15.00)
Tax.create(region: "NU", gst_rate: 5.00, pst_rate: 0.00, hst_rate: 0.00)
Tax.create(region: "ON", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 13.00)
Tax.create(region: "PE", gst_rate: 0.00, pst_rate: 0.00, hst_rate: 15.00)
Tax.create(region: "QC", gst_rate: 5.00, pst_rate: 9.975, hst_rate: 0.00)
Tax.create(region: "SK", gst_rate: 5.00, pst_rate: 6.00, hst_rate: 0.00)
Tax.create(region: "YT", gst_rate: 5.00, pst_rate: 0.00, hst_rate: 0.00)

# Seed Categories
CSV.foreach(Rails.root.join("db/seeds/categories.csv"), headers: true) do |row|
  Category.find_or_create_by(name: row["name"])
end

Rails.logger.debug "Categories have been seeded successfully."

# Seed Accessories
CSV.foreach(Rails.root.join("db/seeds/accessories.csv"), headers: true) do |row|
  category = Category.find_by(name: row["category"])
  if category
    Accessory.find_or_create_by!(
      name:        row["name"],
      description: row["description"],
      price:       row["price"],
      category:
    )
  else
    Rails.logger.debug "Category not found for accessory #{row['name']}. Skipping accessory."
  end
end

Rails.logger.debug "Accessories have been seeded successfully."

# Seed Products
CSV.foreach(Rails.root.join("db/seeds/products.csv"), headers: true) do |row|
  category = Category.find_by(name: row["category"])
  if category
    Product.find_or_create_by!(
      name:               row["name"],
      description:        row["description"],
      price:              row["price"],
      quantity_available: row["quantity_available"],
      leftside_img:       row["leftside_img"],
      rightside_img:      row["rightside_img"],
      front_img:          row["front_img"],
      back_img:           row["back_img"],
      category:
    )
  else
    Rails.logger.debug "Category not found for product #{row['name']}. Skipping product."
  end
end

Rails.logger.debug "Products have been seeded successfully."
