# app/admin/static_pages.rb

ActiveAdmin.register StaticPage do
  # Ensure ActiveAdmin uses slug for URLs
  controller do
    def find_resource
      StaticPage.find_by!(slug: params[:id])
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :slug
    actions
  end

  filter :title
  filter :slug
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :content, as: :quill_editor
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :slug
      row :content
      row :created_at
      row :updated_at
    end
  end
end
