class AdminController < ApplicationController

before_action :authorized?

# methods
  

  private

  def authorized?
    unless current_user.has_role? :admin
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end
end
