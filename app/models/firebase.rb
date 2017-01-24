# => token :text
# => active :boolean
class Firebase < ActiveRecord::Base
	validates :token, presence: true
	validates :token, uniqueness: true

	after_initialize do
		self.active ||= true
	end

	def self.add(params)
		f = Firebase.new
		f.token = params[:token]
		f.save

		puts f.errors.full_messages 
	end

	def self.update(params)
		f = Firebase.find(params[:id])
		update_params = {}
		update_params[:token] = params[:token]
		update_params[:active] = params[:active]
		f.update(update_params)
	end
end
