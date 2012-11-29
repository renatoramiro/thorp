ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => 'access_key_id',
  :secret_access_key => 'secret_access_key'