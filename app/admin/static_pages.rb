ActiveAdmin.register StaticPage do
  permit_params :title, :content, :slug

  index do
    selectable_column
    id_column
    column :title
    column :slug
    actions
  end

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
      row :content do |static_page|
        static_page.content.html_safe
      end
    end
  end
end
