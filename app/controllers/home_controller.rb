class HomeController < ApplicationController
  before_action :set_new_user, :only => [:home, :security_guard, :instructor]

    def home
    end

    def security_guard
    end

    def instructor
    end

    def admin
        # render :layout => false
        # byebug
    end

    private

    def set_new_user
      @user = User.new
    end
end
