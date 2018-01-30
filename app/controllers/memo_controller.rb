class MemoController < ApplicationController
	
	def index
		@memos = Memo.all
		render json: @memos
	end	

	def show
		render json: @memo
	end

	def create
		@user = User.new(memo_params)

		if @memo.save
			render json: @user, status: :created, location: @memo
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	def update
		if @memo.update(memo_params)
			render json: @memo
		else
			render json: @memo.erros, status: :unprocessable_entity
		end
	end

	def destroy
		@memo.destroy
	end

	private

	# Strong params area for memo
	
	def memo_params
		params.permit(:title, :text_body, :date)
	end	

end
