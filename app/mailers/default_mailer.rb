class DefaultMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.default_mailer.confirm_task.subject
  #
  def confirm_task task
    @task = task    
    if task.comments.map(&:email).size > 0  #If any comment, send email to the commenters.
       #mlist= task.comments.map(&:email).join(';')
       mail to: task.comments.map(&:email).join(';') #task.comments.map(&:email)
       # same as  to: task.comments.map {|comment| comment.email}
    end
  end
end
