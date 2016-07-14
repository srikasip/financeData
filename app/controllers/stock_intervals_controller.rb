class StockIntervalsController < ApplicationController
  before_action :set_stock_interval, only: [:edit, :update, :destroy]

  # GET /stock_intervals
  # GET /stock_intervals.json
  def index
    @stock_intervals = StockInterval.all
  end

  # GET /stock_intervals/1
  # GET /stock_intervals/1.json
  def load_intervals
    @tickers = Ticker.all
    for ticker in @tickers
      #get file
      partialPath = "config/FinancialDataFiles/nasdaq/" + ticker.ticker.downcase + ".us.txt"
      filePath = Rails.root.join(partialPath)
      @stringReturn = "----\n"
      # File.open(filePath).each do |line|
      #   @stringReturn = @stringReturn + "\n" + line + "\n"
      # end
    end
  end

  def show      
    begin
      @stock_interval = StockInterval.find(params[:id].to_i)
      @ticker = @stock_interval.ticker
    rescue
      @ticker = params[:id]
    ensure
      @stock_intervals = StockInterval.where(ticker: @ticker).order(:interval)
    end

  end

  # GET /stock_intervals/new
  def new
    @stock_interval = StockInterval.new
  end

  # GET /stock_intervals/1/edit
  def edit
  end

  # POST /stock_intervals
  # POST /stock_intervals.json
  def create
    @stock_interval = StockInterval.new(stock_interval_params)

    respond_to do |format|
      if @stock_interval.save
        format.html { redirect_to @stock_interval, notice: 'Stock interval was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stock_interval }
      else
        format.html { render action: 'new' }
        format.json { render json: @stock_interval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_intervals/1
  # PATCH/PUT /stock_intervals/1.json
  def update
    respond_to do |format|
      if @stock_interval.update(stock_interval_params)
        format.html { redirect_to @stock_interval, notice: 'Stock interval was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stock_interval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_intervals/1
  # DELETE /stock_intervals/1.json
  def destroy
    @stock_interval.destroy
    respond_to do |format|
      format.html { redirect_to stock_intervals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_interval
      @stock_interval = StockInterval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_interval_params
      params.require(:stock_interval).permit(:ticker, :open, :close, :interval, :volume, :percChange)
    end
end
