class RemoveImageName < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :image_name, :string
  end
end
