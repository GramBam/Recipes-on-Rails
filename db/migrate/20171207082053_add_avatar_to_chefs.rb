class AddAvatarToChefs < ActiveRecord::Migration[5.1]
  def change
    add_column :chefs, :picture, :string
  end
end
