class AddNameAgeTelToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :string
    add_column :users, :tel, :string
  end
end
