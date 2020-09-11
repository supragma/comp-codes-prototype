class NewCommentMailer < ApplicationMailer
  def new_comment(job, comment, user)
    @job = job 
    @comment = comment
    @user = user
    mail(to: user.email, subject: 'There is a new comment for your job')
  end
end
