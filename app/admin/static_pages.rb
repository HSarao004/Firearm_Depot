ActiveAdmin.register StaticPage do
  permit_params :title, :slug, :content

  index do
    selectable_column
    id_column
    column :title
    column :slug
    column :content
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :slug
  filter :content
  filter :created_at
  filter :updated_at
end
