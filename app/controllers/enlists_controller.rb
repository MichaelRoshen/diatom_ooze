class EnlistsController < ApplicationController
  # GET /enlists
  # GET /enlists.json
  def week_enlist
    @game = Game.find_by_id(params[:game_id])
    @users = @game.users
  end

  def index
    @enlists = Enlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @enlists }
    end
  end

  # GET /enlists/1
  # GET /enlists/1.json
  def show
    @enlist = Enlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @enlist }
    end
  end

  # GET /enlists/new
  # GET /enlists/new.json
  def new
    @enlist = Enlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @enlist }
    end
  end

  # GET /enlists/1/edit
  def edit
    @enlist = Enlist.find(params[:id])
  end

  # POST /enlists
  # POST /enlists.json
  def create
    @enlist = Enlist.new(params[:enlist])

    respond_to do |format|
      if @enlist.save
        format.html { redirect_to @enlist, notice: 'Enlist was successfully created.' }
        format.json { render json: @enlist, status: :created, location: @enlist }
      else
        format.html { render action: "new" }
        format.json { render json: @enlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /enlists/1
  # PUT /enlists/1.json
  def update
    @enlist = Enlist.find(params[:id])

    respond_to do |format|
      if @enlist.update_attributes(params[:enlist])
        format.html { redirect_to @enlist, notice: 'Enlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enlists/1
  # DELETE /enlists/1.json
  def destroy
    @enlist = Enlist.find(params[:id])
    @enlist.destroy

    respond_to do |format|
      format.html { redirect_to enlists_url }
      format.json { head :no_content }
    end
  end
end
