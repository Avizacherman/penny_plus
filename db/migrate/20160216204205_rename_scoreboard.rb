class RenameScoreboard < ActiveRecord::Migration
  def change
    rename_table :score_boards, :scoreboards
  end
end
