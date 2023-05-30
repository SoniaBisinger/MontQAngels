class FixingToiletPaperBugs < ActiveRecord::Migration[7.0]
  def change
    rename_column :toilet_papers, :thikness, :thickness
    rename_column :toilet_papers, :lenght, :length
  end
end
