class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :address
      t.string :website
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
