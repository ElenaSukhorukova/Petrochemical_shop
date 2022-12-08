class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :country_name
      t.string :language, default: 'en'

      t.timestamps
    end
  end
end
