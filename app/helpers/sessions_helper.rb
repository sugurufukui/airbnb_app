module SessionsHelper

	# 渡されたユーザーでログインする
	def log_in(user)
		session[:user_id] = user.id
	end

#現在ログインしているユーザーを返す
	def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id:session[:user_id])
		end
	end

	# ユーザーがログインしていればtrue、その他ならfalseを返す
	def logged_in?
		!current_user.nil?
	end

	#現在のユーザーをログアウトする
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	#ユーザーアイコン
	def user_avatar
		if !@user.avatar.attached?
			image_tag "default.user.jpeg", :size => '60x60'
		else
			image_tag @user.avatar, :size => '60x60'
		end
	end
end
