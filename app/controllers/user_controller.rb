class UserController < ApplicationController
	# before_action :set_user, only: [:show, :update. :destroy]

	# get '/users'
	def index
		@users = User.all
		render json: @users
	end
	
	# get '/users/:id' 
	def show
		render json: @user
	end

	# post '/users'
	def create
		@user = User.new(user_params)

		if @user.save
			render json: @user, status: :created, location: @user
		else
			render  json: @user.errors, status: :unprocessable_entity
		end
	end

	# patch/put '/users/:id'
	def update
		if @user.update(user_params)
			render json: @user
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	# delete '/users/:id'
	def destroy
		@user.destroy
	end

	private 
	# strong params area for user_params

	def set_user
		@user = User.find(params[:id])
	end
	# only allows :name and :email to be updated
	def user_params
		params.permit(:name, :email)
	end



end
