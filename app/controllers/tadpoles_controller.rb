class TadpolesController < ApplicationController
	before_action :get_tadpole, only: [:show, :edit, :update]

	def index
	  @tadpoles = Tadpole.all
  end

  def new
 		@frogs = Frog.all
 		@tadpole = Tadpole.new
 	end

 	def show
 		#see private method
 	end

 	def edit
 		#private method
 		@tadpoles = Tadpole.all
 	end

 	def update
 		if tadpole.update(tadpole_params)
 			redirect_to @tadpole
 		end
 	end
 	
 	def destroy
 		@tadpole = Tadpole.find(params[:id])
 		@tadpole.destroy
 		redirect to tadpoles_url
 	end

 	def evolve
    tadpole = Tadpole.find(params[:id])
    frog = Frog.new
    frog.name = tadpole.name
    frog.color = tadpole.color
    frog.pond = tadpole.frog.pond
    if frog.save && tadpole.destroy
      redirect to('/frogs')
    end
  end

 	private
    #avi's callback example
  	def get_tadpole
  		@tadpole = Tadpole.find(params[:id].to_i)
  	end

    #security
    def tadpole_params
      params.require(:tadpole).permit(:name, :color, :frog_id)
    end
end

