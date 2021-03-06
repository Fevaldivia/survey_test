class QuestionsController < ApplicationController
  before_filter :authenticate, only: [:new, :create, :edit, :update, :destroy]
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = 'Question was created!'
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def edit
  @question = Question.find_by_id(params[:id])
  end

  def update
    @question = Question.find_by_id(params[:id])
    if @question.update_attributes(question_params)
      flash[:success] = 'Question was updated!'
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find_by_id(params[:id])
    if @question.destroy
      flash[:success] = 'Question was destroyed!'
    else
      flash[:warning] = 'Error destroying question...'
    end
    redirect_to admin_path
  end

  def show
    @question = Question.includes(:alternatives).find_by_id(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:topic, alternatives_attributes: [:id, :title, :_destroy])
  end
end
