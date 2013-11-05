class FrogsController < ApplicationController
  before_action :get_frog, only: [:show, :edit, :update]

  #render 'frogs/index'
  def index
  	@frogs = Frog.all
  end

  #GET /frogs/new
  def new
  	@ponds = Pond.all
  	@frog = Frog.new
  end

  #GET /frogs/:id
  def show
  	#see below. replaced
  end

  #POST /frogs
  def create
  	@frog = Frog.new(frog_params)
  	#replaced with id logic below
  	if @frog.save
  		redirect_to @frog
  	end
  end

  #POST /edit
  def edit
	  #@frog = Frog.find(params[:id]) =>replaced by code below 
    @ponds = Pond.all
  end

  #PATCH/PUT
  def update
  	if @frog.update(frog_params)
  		redirect_to @frog
  	end
  end


  #DELETE /frogs/:id
  def destroy
  	@frog = Frog.find(params[:id])
  	@frog.destroy
  	redirect_to frogs_url
  end
 
 private
    #avi's callback example
  	def get_frog
  		@frog = Frog.find(params[:id])
  	end

    #security
    def frog_params
      params.require(:frog).permit(:name, :color, :pond_id)
    end

end


