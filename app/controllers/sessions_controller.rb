class SessionsController < ApplicationController
	def new
		
	end
	def login
		user=User.find_by(name: params[:name])
		if user
		  session[:user_id]=user.id
          redirect_to("/")
		else
          redirect_to("/sessions/new")
      end
	end
	def logout
		 session.delete :user_id

		redirect_to("/")
	end
end
