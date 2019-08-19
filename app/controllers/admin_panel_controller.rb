class AdminPanelController < ApplicationController
  before_action :group_users, :only => [:index, :all_employers, :all_employees, :all_instructors]
  # load_and_authorize_resource class: false

  def index

  end

  def all_employers

  end

  def all_employees

  end

  def all_instructors

  end

  private

  def group_users
    @employers = User.where(:user_type => "employer")
    @employees = User.where(:user_type => "employee")
    @instructors = User.where(:user_type => "instructor")
  end
end
