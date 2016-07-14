class AddIndexToStockInterval < ActiveRecord::Migration
  def change
    add_index :stock_intervals, :ticker
    add_index :stock_intervals, :interval
  end
end
