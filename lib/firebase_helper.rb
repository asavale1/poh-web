module FirebaseHelper
	def self.make_request

		require 'net/http'
		require 'uri'
		require 'json'

		uri = URI.parse("https://fcm.googleapis.com/fcm/send")

		header = {
			'Content-Type' => 'application/json',
			'Authorization' => 'key=AAAArb9-hJA:APA91bEJiGX8XAT9mUSmcCgwCvYSQHfSRco1uRAJfsi6RyP5yZQ4RozXsrDvIcpiy_35Uh0RXNQACNZRK6QG0z3no29MRHmaGYYYEX8MPvn1B3kV1Or1wT_67FdYPaEjswMw4gQI2sA_-R_SRCvTFbnsBAsdMNf5hg'
		}

		data = {
			"to" => "/topics/users"
		}

		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		puts uri.request_uri
		puts header
		request = Net::HTTP::Post.new(uri.request_uri, header)
		request.body = data.to_json

		response = http.request(request)
=begin
		uri = URI.parse("https://fcm.googleapis.com/fcm/send")

		header = {
			'Content-Type' => 'application/json',
			"Authorization" => "key=AAAArb9-hJA:APA91bEJiGX8XAT9mUSmcCgwCvYSQHfSRco1uRAJfsi6RyP5yZQ4RozXsrDvIcpiy_35Uh0RXNQACNZRK6QG0z3no29MRHmaGYYYEX8MPvn1B3kV1Or1wT_67FdYPaEjswMw4gQI2sA_-R_SRCvTFbnsBAsdMNf5hg"
		}
		user = {
			:to => "fFJ7Snrd2Uo:APA91bHgO03C3Ld9bGU4VuW5QLBlQ2OF2MkW7FzAs8yHVrK_ANY4JtYErYFQlK1LQ4jrep1VsDV6Wme71YmU95ZJU8o4PrXOKH0QZM1WUeQIDhol4sgRomxEv2inXjSb7Q5E69rYoQSw",
			data: {
				type: "new_question"
			}
		}

		puts "Making Request"

		# Create the HTTP objects
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		request = Net::HTTP::Post.new(uri.request_uri, header)
		request.body = user.to_json


		# Send the request
		response = http.request(request)

		puts response.body
=end
	end

end