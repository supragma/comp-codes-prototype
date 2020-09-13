class AddContractorbidToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :contractorbid, :boolean
  end
end
