class RoomsController < ApplicationController
	def index
		@room = Room.all
	end

	def show
		@room = Room.find(params[:id])
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)
		@room.image.attach(params[:room][:image])

		if @room.save
			flash[:success] = "ルームを登録しました"
			redirect_to room_path(room)
		else
			render 'new'
		end
	end

	def edit
		@room = Room.find(params[:id])
	end

	def update
		@room = Room.find(params[:id])
	end

	def destroy
		@room = Room.find(params[:id])
	end
end


private

	def room_params
		params.require(:room).permit(:name, :introduction, :price, :address, :image)
	end
