class PollsController < ApplicationController
  before_action :require_login, only: [:create, :new]

  def create
    build_poll

    if @poll.save
      redirect_to current_user_path
    else
      redirect_to new_poll_path
    end
  end

  def index
    @polls = Poll.all
  end

  def new
    @poll = Poll.new
  end

  def show
    @poll = Poll.find params[:id]
  end

  private

  def build_poll
    @poll = Poll.new poll_params
    params[:questions].each_with_index do |question, index|
      next if question[:text].blank?
      build_question(index, question)
    end
  end

  def build_question(index, question)
    question = @poll.questions.build text: question[:text]
    params["choices_#{index + 1}"].each do |choice|
      question.choices.build value: choice[:value] unless choice[:value].blank?
    end
  end

  def poll_params
    params.require(:poll).permit(:name).merge(user_id: current_user_id)
  end
end
