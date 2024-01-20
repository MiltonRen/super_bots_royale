class ArenasController < ApplicationController
  before_action :set_arena, only: %i[ show edit update destroy participate start conclude ]

  # GET /arenas or /arenas.json
  def index
    @arenas = Arena.all.order(id: :desc)
  end

  # GET /arenas/1 or /arenas/1.json
  def show
  end

  # GET /arenas/new
  def new
    if Arena.any? {|a| !a.concluded?}
      redirect_to root_path, notice: "There is a game in progress!"
      return
    end

    @arena = Arena.new
  end

  # GET /arenas/1/edit
  def edit
  end

  # POST /arenas or /arenas.json
  def create
    if Arena.any? {|a| !a.concluded?}
      redirect_to root_path, notice: "There is a game in progress!"
      return
    end

    @arena = Arena.new(arena_params)

    respond_to do |format|
      if @arena.save
        format.html { redirect_to arena_url(@arena), notice: "Game was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arenas/1 or /arenas/1.json
  def update
    respond_to do |format|
      if @arena.update(arena_params)
        format.html { redirect_to arena_url(@arena), notice: "Game was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arenas/1 or /arenas/1.json
  def destroy
    @arena.destroy!

    respond_to do |format|
      format.html { redirect_to arenas_url, notice: "Arena was successfully destroyed." }
    end
  end

  # PATCH
  def participate
    if @arena.concluded?
      redirect_to root_path, notice: "GAME ALREADY CONCLUDED - START A NEW ONE!"
      return
    end

    if @arena.started?
      redirect_to @arena, notice: "GAME ALREADY STARTED - WAIT FOR NEXT ROUND!"
      return
    end

    @bot = Bot.find(params[:bot_id])
    @bot.check_for_image_generation!
    if @bot.image_link.blank?
      redirect_to @bot, notice: "YOU DON'T HAVE AN IMAGE YET!"
      return
    end

    if Participation.find_by(bot: @bot, arena: @arena).present?
      redirect_to @arena, notice: "RADICAL PARTICIPATION!"
      return
    end

    p = Participation.create!(bot: @bot, arena: @arena)

    respond_to do |format|
      format.html { redirect_to @arena, notice: "RADICAL PARTICIPATION!" }
    end
  end

  def start
    tiles = []
    (1..100).each do |count|
      tiles << Tile.new(arena: @arena, number: count, item: Item.random_item_or_nothing)
    end

    participations = @arena.participations
    participations.each do |participation|
      participation.tile = tiles.sample
    end

    respond_to do |format|
      ApplicationRecord.transaction do
        tiles.each {|tile| tile.save!}
        participations.each {|participation| participation.save!}
        @arena.update!(started: true)
      end
      format.html { redirect_to @arena, notice: "GAME START!" }
    rescue
      format.html { redirect_to @arena, notice: "ERROR! MILTON DEBUG" }
    end
  end

  def conclude
    respond_to do |format|
      @arena.update!(concluded: true)
      format.html { redirect_to root_path, notice: "GAME CONCLUDED!" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arena
      @arena = Arena.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def arena_params
      params.require(:arena).permit(:name)
    end
end
