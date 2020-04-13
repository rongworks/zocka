class GameEntriesController < ApplicationController
  before_action :set_game_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /game_entries
  # GET /game_entries.json
  def index
    @game_entries = GameEntry.ranked
  end

  # GET /game_entries/1
  # GET /game_entries/1.json
  def show
  end

  # GET /game_entries/new
  def new
    @game_entry = GameEntry.new
  end

  # GET /game_entries/1/edit
  def edit
  end

  # POST /game_entries
  # POST /game_entries.json
  def create
    @game_entry = GameEntry.new(game_entry_params)

    respond_to do |format|
      if @game_entry.save
        format.html { redirect_to game_entries_path, notice: 'Game entry was successfully created.' }
        format.json { render :show, status: :created, location: @game_entry }
      else
        format.html { render :new }
        format.json { render json: @game_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_entries/1
  # PATCH/PUT /game_entries/1.json
  def update
    respond_to do |format|
      if @game_entry.update(game_entry_params)
        format.html { redirect_to game_entries_path, notice: 'Game entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_entry }
      else
        format.html { render :edit }
        format.json { render json: @game_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_entries/1
  # DELETE /game_entries/1.json
  def destroy
    @game_entry.destroy
    respond_to do |format|
      format.html { redirect_to game_entries_url, notice: 'Game entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @game_entry = GameEntry.find(params[:game_entry_id])
    comment = params[:comment] || ''
    @game_entry.vote(1, current_user, comment)
    redirect_to game_entries_path
  end

  def downvote
    @game_entry = GameEntry.find(params[:game_entry_id])
    comment = params[:comment] || ''
    @game_entry.vote(-1, current_user, comment)
    redirect_to game_entries_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_game_entry
      @game_entry = GameEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_entry_params
      params.require(:game_entry).permit(:name, :description, :game_url)
    end
end
