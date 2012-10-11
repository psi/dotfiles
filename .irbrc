if Object.const_defined?("ActiveRecord")
  IRB.conf[:IRB_RC] = Proc.new do
    ActiveRecord::Base.connection.instance_variable_set :@logger, Logger.new(STDOUT)
  end
end
