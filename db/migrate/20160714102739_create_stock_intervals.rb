class CreateStockIntervals < ActiveRecord::Migration
  def change
    create_table :stock_intervals do |t|
      t.string :ticker
      t.float :open
      t.float :close
      t.datetime :interval
      t.integer :volume
      t.float :percChange

      t.timestamps
    end
  end
end
