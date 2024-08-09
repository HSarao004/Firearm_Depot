ActiveAdmin.register Tax do
  permit_params :region, :gst_rate, :pst_rate, :hst_rate

  index do
    selectable_column
    id_column
    column :region
    column :gst_rate
    column :pst_rate
    column :hst_rate
    actions
  end

  filter :region
  filter :gst_rate
  filter :pst_rate
  filter :hst_rate

  form do |f|
    f.inputs do
      f.input :region
      f.input :gst_rate
      f.input :pst_rate
      f.input :hst_rate
    end
    f.actions
  end

  show do
    attributes_table do
      row :region
      row :gst_rate
      row :pst_rate
      row :hst_rate
    end
  end

  controller do
    def destroy
      tax = Tax.find(params[:id])
      if tax.orders.exists?
        redirect_to admin_taxes_path, alert: "Cannot delete tax that is associated with existing orders."
      else
        tax.destroy
        redirect_to admin_taxes_path, notice: "Tax successfully deleted."
      end
    end
  end
end
