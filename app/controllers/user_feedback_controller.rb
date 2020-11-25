class UserFeedbackController < ApplicationController
    def new 
    @user_feedback = UserFeedback.new
    end
end
