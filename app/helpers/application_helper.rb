module ApplicationHelper

	def pretty_date
		t = Time.now
		t.strftime("%A, %B, %d")
	end
end
