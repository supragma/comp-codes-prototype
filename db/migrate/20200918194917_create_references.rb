class CreateReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :references do |t|
      t.integer :user_id
      t.integer :profile_id
      t.text :content

      t.timestamps
    end
  end
end
