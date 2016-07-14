class CreateTickers < ActiveRecord::Migration
  def change
    create_table :tickers do |t|
      t.string :ticker

      t.timestamps
    end
  end
end
