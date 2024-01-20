class BotsController < ApplicationController
  before_action :set_bot, only: %i[ show edit update destroy ]

  # GET /bots or /bots.json
  def index
    @bots = Bot.all
  end

  # GET /bots/1 or /bots/1.json
  def show
  end

  # GET /bots/new
  def new
    @bot = Bot.new
  end

  # GET /bots/1/edit
  def edit
  end

  # POST /bots or /bots.json
  def create
    @bot = Bot.new(bot_params)

    respond_to do |format|
      if @bot.save
        format.html { redirect_to bot_url(@bot), notice: "Bot was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bots/1 or /bots/1.json
  def update
    respond_to do |format|
      if @bot.update(bot_params)
        format.html { redirect_to bot_url(@bot), notice: "Bot was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bots/1 or /bots/1.json
  def destroy
    @bot.destroy!

    respond_to do |format|
      format.html { redirect_to bots_url, notice: "Bot was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bot
      @bot = Bot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bot_params
      params.require(:bot).permit(:name, :element, :description, :move_name, :catchphrase)
    end
end
