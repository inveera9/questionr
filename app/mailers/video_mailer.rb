class VideoMailer < ApplicationMailer

  def video_submission(user)
    @user = user
    email = user.email
    mail(:to => email , 
        :cc => "xanni@opendemocracy.me", 
        :subject => "Thank you for contributing to Questionr!"
         )
  end

  def thanks_for_signup(name, email)
    @username = name
    mail(:to => email , 
        :cc => "xanni@opendemocracy.me", 
        :subject => "Thanks for attending event."
         )
  end
  
end
