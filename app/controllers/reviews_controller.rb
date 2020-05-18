class ReviewsController < ApplicationController

	def index
		# this is our listpage for our reviews


		@number = rand(100)

		@reviews = Review.all

	end

	def new
		#the form for adding a new review(only the form)
		@review = Review.new

	end

	def create
		#take the info from the form and add it to the database

		@review = Review.new(form_params)


		#save this to database

		@review.save

		# redirect back to home page
		redirect_to root_path


	end

	def show
		#individual review page

		@review = Review.find(params[:id])


	end

	def destroy

		#find the individual review
		@review = Review.find(params[:id])


		#destroy
		@review.destroy
		#redirect to home page

		redirect_to root_path

	end


	def edit
		#find the individual review (to edit)
		@review = Review.find(params[:id])


	end

	def update
		#find individual review
		@review = Review.find(params[:id])


		#update with new info from the form
		@review.update(form_params)

		#redirect somewhere
		redirect_to review_path(@review) 

	end

	def form_params

		params.require(:review).permit(:title, :body, :score)

	end


end
