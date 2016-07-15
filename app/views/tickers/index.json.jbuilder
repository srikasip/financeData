json.array!(@tickers) do |ticker|
  json.extract! ticker, :ticker
end