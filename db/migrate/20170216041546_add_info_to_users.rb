class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :age, :integer
  end
end
