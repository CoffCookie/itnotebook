class Removeimagefromimages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :image, :string
  end
end
