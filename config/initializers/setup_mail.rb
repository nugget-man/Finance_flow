ActionMailer::Base.smtp_settings={
    :address => 'smtp.gmail.com',
    :port => 587,
    :domain => 'gmail.com',
    :user_name => 'financeflowmail',
    :password => 'KatieLynn3',
    :authentication => 'plain',
    :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options[:host] = '192.168.1.222'