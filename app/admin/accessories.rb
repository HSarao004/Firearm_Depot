ActiveAdmin.register Accessory do
  permit_params :name, :description, :price, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :category
    actions
  end

  filter :name
  filter :category

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :category
    end
    f.actions
  end
end
