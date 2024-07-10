ActiveAdmin.register Product do
  permit_params :name, :description, :price, :quantity_available, :leftside_img, :rightside_img, :front_img, :back_img, :category_id

  controller do
    helper ProductsHelper
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :quantity_available
    column "Left Image" do |product|
      if product.leftside_img.present?
        image_tag("/images/products/#{product.leftside_img}", size: "50x50")
      else
        "No image"
      end
    end
    column "Right Image" do |product|
      if product.rightside_img.present?
        image_tag("/images/products/#{product.rightside_img}", size: "50x50")
      else
        "No image"
      end
    end
    column "Front Image" do |product|
      if product.front_img.present?
        image_tag("/images/products/#{product.front_img}", size: "50x50")
      else
        "No image"
      end
    end
    column "Back Image" do |product|
      if product.back_img.present?
        image_tag("/images/products/#{product.back_img}", size: "50x50")
      else
        "No image"
      end
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
        if product.leftside_img.present?
          image_tag("/images/products/#{product.leftside_img}")
        else
          "No image"
        end
      end
      row "Right Image" do |product|
        if product.rightside_img.present?
          image_tag("/images/products/#{product.rightside_img}")
        else
          "No image"
        end
      end
      row "Front Image" do |product|
        if product.front_img.present?
          image_tag("/images/products/#{product.front_img}")
        else
          "No image"
        end
      end
      row "Back Image" do |product|
        if product.back_img.present?
          image_tag("/images/products/#{product.back_img}")
        else
          "No image"
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity_available
      f.input :leftside_img, as: :select, collection: image_options_for_select, include_blank: true
      f.input :rightside_img, as: :select, collection: image_options_for_select, include_blank: true
      f.input :front_img, as: :select, collection: image_options_for_select, include_blank: true
      f.input :back_img, as: :select, collection: image_options_for_select, include_blank: true
      f.input :category
    end
    f.actions
  end
end
