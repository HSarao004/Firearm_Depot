ActiveAdmin.register Accessory do
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column "Category" do |accessory|
      accessory.category.name if accessory.category.present?
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row "Category" do |accessory|
        accessory.category.name if accessory.category.present?
      end
    end
  end

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
