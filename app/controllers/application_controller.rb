class ApplicationController < ActionController::API
	# This imports http authentication library from Action Controller
	include ActionController::HTTPAuthentication::Token::ControllerMethods
	# ********************************************************************
	# Requires authentication for all controllers
	before_action :require_login
	# ********************************************************************
	# Method will be called when authentication is needed
	def require_login
		authorize_request || render_unauthorized("Access Denied")
	end
	# ********************************************************************
	# Helper method aids in searching current user in request
	def current_user
		@current_user ||= authorize_request
	end
	# ********************************************************************
	# Shows error message when user is not authorized
	def render_unauthorized(message)
		errors = {errors: [{detail: message}]}
		render json: errors, status: :unauthorized
	end

	# ********************************************************************
	private

	# Authenticate a user by token
	def authorize_request
		authenticate_with_http_token do |token, options|
			User.find_by(token: token)
		end
	end

end
