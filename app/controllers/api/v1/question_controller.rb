class Api::V1::QuestionController < Api::V1::BaseController
	skip_before_filter :verify_authenticity_token, :only => [:post_answer, :get_question, :request_question]

	def post_answer
		q = Question.find(params[:question_id])
		
		if(params[:answer] =~ /yes/)
			q.yes_count += 1
		elsif params[:answer] =~ /no/
			q.no_count += 1
		end

		q.save

		head 200, content_type: "text/html"
	end

	def get_question
		q = Question.where(:current => true).first#Question.where(:asked => false, :reviewed => true).order(:created_at).first

		(!q.nil?) ? render(:json => q.to_json, status: 200) : head(400, content_type: "text/html")
		
	end

	def get_results
		begin
			q = Question.find(params[:id])
			
		rescue
			q = Question.where(:asked => true).order("created_at DESC").first
		end
		#q = (params[:id].to_i == -1) ? Question.where(:asked => true).order("created_at DESC").first : Question.find(params[:id])
		
		render :json => { 
				:yes_count => q.yes_count,
				:no_count => q.no_count,
				:total => (q.yes_count + q.no_count),
				:question => q.question
			}, status: 200
	end

	def request_question
		
		q = Question.new({:question => params[:question]})
		(q.save) ? head(200, content_type: "text/html") : head(400, content_type: "text/html")

		
	end


end
