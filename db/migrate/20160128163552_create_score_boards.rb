class CreateScoreBoards < ActiveRecord::Migration
  def change
    create_table :score_boards do |t|

      t.bigint :score
      t.money :total_payout


      t.timestamps null: false
    end
    add_reference :score_boards, :user, index: true, foreign_key: true
  end
end
