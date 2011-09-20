class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :phone_number

      t.timestamps
    end
  end
end
