class AddDefaultTaxes < ActiveRecord::Migration[6.0]
  def change
    Tax.create(region: 'BC', gst_rate: 5.0, pst_rate: 7.0, hst_rate: 0.0)
    Tax.create(region: 'MB', gst_rate: 5.0, pst_rate: 7.0, hst_rate: 0.0)
    Tax.create(region: 'NS', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 15.0)
    Tax.create(region: 'ON', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 13.0)
    Tax.create(region: 'QC', gst_rate: 5.0, pst_rate: 9.975, hst_rate: 0.0)
    Tax.create(region: 'AB', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0)
    Tax.create(region: 'SK', gst_rate: 5.0, pst_rate: 6.0, hst_rate: 0.0)
    Tax.create(region: 'NB', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 15.0)
    Tax.create(region: 'PE', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 15.0)
    Tax.create(region: 'NL', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 15.0)
    Tax.create(region: 'NT', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0)
    Tax.create(region: 'YT', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0)
    Tax.create(region: 'NU', gst_rate: 5.0, pst_rate: 0.0, hst_rate: 0.0)
  end
end
