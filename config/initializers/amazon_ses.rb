ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => 'your_access_id',
  :secret_access_key => 'your_secret_access_key'