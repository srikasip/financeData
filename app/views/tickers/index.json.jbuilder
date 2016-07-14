json.array!(@tickers) do |ticker|
  json.extract! ticker, :ticker
  json.url ticker_url(ticker, format: :json)
end