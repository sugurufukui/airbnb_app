class ReservationsController < ApplicationController
  def index
    @user = current_user
    @room = Room.find_by(params[:id])
    @reservations = current_user.reservations
    @reservation = Reservation.find_by(params[:id])
  end

  def show
    @reservation = Reservation.find(params[:id])
    @user = current_user
  end

  def new
    @reservation = Reservation.new
    @user = current_user
    @room = Room.find_by(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @user = current_user
    @room = Room.find_by(params[:id])
    if @reservation.save
      flash[:success] = "予約情報をご確認いただき、お間違えがなければ予約確定ボタンを押してください"
      redirect_to @reservation
    else
      flash.now[:danger] = "予約ができませんでした"
      render "rooms/show"
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    flash[:success] = "#{@reservation.room.name}のご予約が完了しました"
    redirect_to reservations_path

  end


end

private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :person_num, :user_id, :room_id)
    end
