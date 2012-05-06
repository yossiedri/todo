class TodotasksController < ApplicationController
  # GET /todotasks
  # GET /todotasks.json
  def index
    @todotasks = Todotask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todotasks }
    end
  end

  # GET /todotasks/1
  # GET /todotasks/1.json
  def show
    @todotask = Todotask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todotask }
    end
  end

  # GET /todotasks/new
  # GET /todotasks/new.json
  def new
    @todotask = Todotask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todotask }
    end
  end

  # GET /todotasks/1/edit
  def edit
    @todotask = Todotask.find(params[:id])
  end

  # POST /todotasks
  # POST /todotasks.json
  def create
    @todotask = Todotask.new(params[:todotask])

    respond_to do |format|
      if @todotask.save
        format.html { redirect_to @todotask, notice: 'Todotask was successfully created.' }
        format.json { render json: @todotask, status: :created, location: @todotask }
      else
        format.html { render action: "new" }
        format.json { render json: @todotask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todotasks/1
  # PUT /todotasks/1.json
  def update
    @todotask = Todotask.find(params[:id])

    respond_to do |format|
      if @todotask.update_attributes(params[:todotask])
        format.html { redirect_to @todotask, notice: 'Todotask was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @todotask.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @todotask = Todotask.find(params[:id])
    @todotask.destroy

    respond_to do |format|
      format.html { redirect_to todotasks_url }
      format.json { head :no_content }
    end
  end
end
