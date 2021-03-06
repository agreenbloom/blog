class EntriesController < ApplicationController
  # before_action :set_entry, only: [:show, :index]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.friendly.find(params[:slug])
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    @entry.admin = current_admin
    @entry.published_at = Time.now

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.friendly.find(params[:slug])
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    @entry = Entry.friendly.find(params[:slug])
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_entry
    #   @entry = Entry.friendly.find(params[:slug])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:description, :title, :published_at, :slug, :category, :admin_id)
    end
end
