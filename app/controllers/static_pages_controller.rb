class StaticPagesController < ApplicationController
  before_action :sessionless_user

  def home
  end

  def help
  end

  def about
  end
end
