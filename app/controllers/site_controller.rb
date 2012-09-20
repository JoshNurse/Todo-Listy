class SiteController < ApplicationController
  
  def contribute
    @users = User.count
  end
  
end