class AdminsController < ApplicationController
  before_filter :authenticate

  layout "admin"

  def index
    @questions = Question.all
  end

end
