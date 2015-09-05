class ApiController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:submit_answer, :get_question]
	def submit_answer
		puts params
		render :json => { :status => "success" }
	end

	def get_question
		q = Question.where(:asked => false).order(:created_at).first

		render :json => q.to_json
	end
end
