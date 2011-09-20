class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mobile_number

      t.timestamps
    end
  end
end
