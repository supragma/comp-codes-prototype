class AddPwToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pw, :string
  end
end
