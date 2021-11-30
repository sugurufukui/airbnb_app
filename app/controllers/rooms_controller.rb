class RoomsController < ApplicationController
	def index
		@rooms = Room.all
		binding.pryroo
	end

	def show
		@room = Room.find(params[:id])
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new(room_params)
		@room.room_image.attach(params[:room][:room_image])
		@room.user = current_user
		if @room.save
			flash[:success] = "ルームを登録しました"
			redirect_to @room
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
		params.require(:room).permit(:user_id, :name, :introduction, :price, :address, :room_image)
	end
