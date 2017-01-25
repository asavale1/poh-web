class QuestionController < ApplicationController
	before_filter :authenticate_admin
	before_filter :save_login_state, :only => [:login, :login_attempt]

	include FirebaseHelper

	def index

	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		@question.reviewed = true
		if @question.save
			flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
		else
			flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
		end
		redirect_to :action => :index
	end

	def send_notification
		require "firebase_helper"
		FirebaseHelper.make_request()
		Notification.new.save

		redirect_to :action => "index"

	end

	def destroy
		begin
			Question.find(params[:id]).destroy
		rescue Exception => e
			puts e.message
		end

		redirect_to :action => :index
	end

	def edit
		@q = Question.find(params[:id])
	end

	def update

		begin
			q = Question.find(params[:id])
			q.question = params[:question]
			q.reviewed = params[:reviewed]
			q.current = params[:current]

			if params[:asked]
				q.asked = params[:asked] if q.reviewed 
			else 
				q.asked = params[:asked]
			end
			q.save
		rescue Exception => e
			puts e.message
		end
		
		redirect_to :action => :index
	end

	private
		def question_params
			params.require(:question).permit(:question)
		end
end
