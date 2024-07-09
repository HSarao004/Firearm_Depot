ActiveAdmin.register Product do
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :quantity_available
    column "Left Image" do |product|
      image_tag(product.leftside_img, size: "50x50") if product.leftside_img.present?
    end
    column "Right Image" do |product|
      image_tag(product.rightside_img, size: "50x50") if product.rightside_img.present?
    end
    column "Front Image" do |product|
      image_tag(product.front_img, size: "50x50") if product.front_img.present?
    end
    column "Back Image" do |product|
      image_tag(product.back_img, size: "50x50") if product.back_img.present?
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :quantity_available
      row "Left Image" do |product|
        image_tag(product.leftside_img) if product.leftside_img.present?
      end
      row "Right Image" do |product|
        image_tag(product.rightside_img) if product.rightside_img.present?
      end
      row "Front Image" do |product|
        image_tag(product.front_img) if product.front_img.present?
      end
      row "Back Image" do |product|
        image_tag(product.back_img) if product.back_img.present?
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity_available
      f.input :leftside_img, as: :file
      f.input :rightside_img, as: :file
      f.input :front_img, as: :file
      f.input :back_img, as: :file
      f.input :category
    end
    f.actions
  end
end
