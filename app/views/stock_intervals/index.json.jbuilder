json.array!(@stock_intervals) do |stock_interval|
  json.extract! stock_interval, :ticker, :open, :close, :interval, :volume, :percChange
end