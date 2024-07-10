module ProductsHelper
  def image_options_for_select
    Dir.glob(Rails.root.join("public/images/products/*")).map do |image_path|
      [File.basename(image_path), File.basename(image_path)]
    end
  end
end
