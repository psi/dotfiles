if ENV['RAILS_ENV']
  IRB.conf[:IRB_RC] = Proc.new do
    ActiveRecord::Base.connection.instance_variable_set :@logger, Logger.new(STDOUT)
  end
end
