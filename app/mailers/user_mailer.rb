class UserMailer < ActionMailer::Base
  default :from => "financeflowmail@gmail.com"

  def reminder_mailer(user)
    mail(:to => user.email, :subject => 'Finance Summary')
    @stepones   = Stepone.find_all_by_title('In Progress')
    @steptwos   = Steptwo.find_all_by_title('In Progress')
    @stepthrees = Stepthree.find_all_by_title('In Progress')
    @stepfours  = Stepfour.find_all_by_title('In Progress')
    @stepfives  = Stepfive.find_all_by_title('In Progress')
    @stepsixes  = Stepsix.find_all_by_title('In Progress')
    @stepsevens = Stepseven.find_all_by_title('In Progress')
    @stepeights = Stepeight.find_all_by_title('In Progress')
    @stepnines  = Stepnine.find_all_by_title('In Progress')
    @steptens   = Stepten.find_all_by_title('In Progress')
  end
end
