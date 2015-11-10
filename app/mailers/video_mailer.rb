class VideoMailer < ApplicationMailer

	def video_submission(user)
		@user = user
		email = user.email
		mail(:to => email , 
				:cc => "xanni@opendemocracy.me", 
				:subject => "Thank you for contributing to Questionr!"
     		 )
	end
	
end
