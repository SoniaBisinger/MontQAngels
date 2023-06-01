class DeletePremiumAddDescriptionToToiletPapers < ActiveRecord::Migration[7.0]
  def change
    remove_column :toilet_papers, :premium
    add_column :toilet_papers, :description, :text
  end
end
