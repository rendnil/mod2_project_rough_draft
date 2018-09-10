class CreateBlackjacks < ActiveRecord::Migration[5.2]
  def change
    create_table :blackjacks do |t|

      t.timestamps
    end
  end
end
