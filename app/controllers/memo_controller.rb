class MemoController < ApplicationController
	
	def index
		@memos = Memo.all
		render json: @memos
	end	

	def show
		render json: @memo
	end

	def create
		@memo = Memo.new(memo_params)

		# adds current logged in user as creator of memo
		# current_user is being called from application controller / universal access
		@memo.user = current_user

		if @memo.save
			render json: @memo, status: :created, location: @memo
		else
			render json: @memo.errors, status: :unprocessable_entity
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
