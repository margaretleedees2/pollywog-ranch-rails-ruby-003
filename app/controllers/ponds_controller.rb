class PondsController < ApplicationController
  before_action :get_pond, only: [:show, :edit, :update]

  #render 'ponds/index'
  def index
  	@ponds = Pond.all
  end

  #GET /ponds/new
  def new
  	@pond = Pond.new
  end

  #GET /ponds/:id
  def show
    #see below. replaced @pond = Pond.find(params[:id])
  end

  #POST /ponds
  def create
  	@pond = Pond.new(pond_params)
  	# @pond.name = params[:name]
  	# @pond.water_type = params[:water_type]
  	if @pond.save
  	 redirect_to @pond
    end
  end

  def edit
    #see below: replaces @pond = Pond.find(params[:id])
  end

  #PATCH/PUT /ponds/:id
  def update
  	if @pond.update(pond_params)
  	 redirect_to @pond
    end
  end

  # DELETE /ponds/:id
  # ponds_path returns /photos
  # www.guides.rubyonrails.org/routing.html
  def destroy
    #delete all frogs & tadpoles at this pond id?
  	@pond = Pond.find(params[:id])
    @pond.destroy
  	redirect_to ponds_url

  end

  private
    #avi's callback example
  	def get_pond
  		@pond = Pond.find(params[:id].to_i)
  	end

    #security
    def pond_params
      params.require(:pond).permit(:name, :water_type)
    end

end
