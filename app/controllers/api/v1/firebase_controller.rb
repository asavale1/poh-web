class Api::V1::FirebaseController < Api::V1::BaseController
	skip_before_filter :verify_authenticity_token, :only => [:register]

	def register
		Firebase.add(params[:firebase])
		head 200, content_type: "text/html"
	end

end