class VotesController < ApplicationController
  def create
    if current_user && params[:question] && params[:question][:id] && params[:alternative] && params[:alternative][:id]
      @question = Question.find_by_id(params[:question][:id])
      @option = @question.alternatives.find_by_id(params[:alternative][:id])
      if @option && @question && !current_user.voted_for?(@question)
        @option.votes.create({user_id: current_user.id})
      else
        render js: 'alert(\'Your vote cannot be saved. Have you already voted?\');'
      end
    else
      render js: 'alert(\'Your vote cannot be saved.\');'
    end

  end
end
