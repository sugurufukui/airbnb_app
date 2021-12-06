class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

	default_scope -> { order(start_date: :desc) }

	validates :user_id, presence: true
	validates :room_id, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :person_num, numericality: true

	# validate :date_before_start
	# validate :date_before_finish



  def date_before_start
    if @reservationstart_date < Date.today
      errors.add( "チェックインは今日以降のものを選択してください")
    end
  end

  def date_before_finish
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, "は開始日以降のものを選択してください") if end_date < start_date
  end

end
