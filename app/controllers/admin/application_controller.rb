# All Administrate controllers inherit from this `Admins::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.

class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

end

