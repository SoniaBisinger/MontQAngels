class DeleteLenghtAddTitleAndPhotoUrl < ActiveRecord::Migration[7.0]
  def change
    remove_column :toilet_papers, :length
    add_column :toilet_papers, :title, :string
    add_column :toilet_papers, :photo_url, :string
  end
end
