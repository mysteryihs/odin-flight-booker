class PassengerMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def thank_you_email(passenger, booking)
		@booking = booking
		@name = passenger.name
		mail(to: passenger.email, subject: 'Thank you for signing up')
	end
end
