# => question 	: string(255)
# => yes_count 	: integer
# => no_count	: integer
class Question < ActiveRecord::Base
	validates :question, presence: true

	after_initialize do
		self.yes_count ||= 0
		self.no_count ||= 0
	end
end
