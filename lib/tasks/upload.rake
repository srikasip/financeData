namespace :upload do
  desc "TODO"
  task nasdaq: :environment do
    #get file
    @tickers = Ticker.all
    for ticker in @tickers
      partialPath = "config/FinancialDataFiles/nasdaq/" + ticker.ticker.downcase + ".us.txt"
      filePath = Rails.root.join(partialPath)
      puts "Starting on: " + ticker.ticker
      count = 0
      lineCount = 0
      File.open(filePath).each do |line|
        lineCount += 1
        begin
          line = line.strip
          if line != "Date,Time,Open,High,Low,Close,Volume,OpenInt" and line != ""

            partials = line.split(',')
            si = StockInterval.new
            si.ticker = ticker.ticker #ticker
            si.open = partials[2].strip.to_f #open
            si.close = partials[5].strip.to_f #close
            si.volume = partials[6].strip.to_i #volume
            si.percChange = ((si.close - si.open)/si.open) #percent change
            dateString = partials[0].strip + "T" + partials[1].strip + "+06:00" #datetime
            si.interval = DateTime.iso8601(dateString)

            si.save
            count += 1
          end
        rescue
          puts "ERROR: " + ticker.ticker + " " + lineCount.to_s
          puts line
          puts "Error String: #{$!}"
        end
      end
      puts "Done: " + count.to_s + "\n"
    end
  end

  desc "TODO"
  task nasdaqSim: :environment do
  end

end