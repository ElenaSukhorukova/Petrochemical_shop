class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :region_name
      t.integer :distance_from_moscow_to_center_region
      t.string :language, default: 'en'
      t.references :country, foreign_key: true
      
      t.timestamps
    end
  end
end
