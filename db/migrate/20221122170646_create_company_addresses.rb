class CreateCompanyAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :company_addresses do |t|
      t.string :post_nubmer    
      t.string :country
      t.string :region
      t.string :town
      t.string :street
      t.string :number_building
      t.text :description
      t.string :type
      t.references :addressabable, polymorphic: true
      
      t.timestamps
    end
  end
end
