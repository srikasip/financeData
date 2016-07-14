json.array!(@stock_intervals) do |stock_interval|
  json.extract! stock_interval, :ticker, :open, :close, :interval, :volume, :percChange
  json.url stock_interval_url(stock_interval, format: :json)
end