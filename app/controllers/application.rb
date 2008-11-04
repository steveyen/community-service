# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'de31d26335a12ea8411857ed880f7c09'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  # Save a read-only snapshot of the community engine config.
  #
  @@AppConfig_initial = AppConfig.clone

  before_filter :app_config_filter

  private
    def app_config_filter
      AppConfig.community_name = "some community name"
      print " xxx= #{@@AppConfig_initial.community_name}\n"
      print " yyy= #{AppConfig.community_name}\n"
    end
end
