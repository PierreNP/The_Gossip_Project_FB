class WelcomeController < ApplicationController
  def landing
    @user = params[:page]
  end
end
