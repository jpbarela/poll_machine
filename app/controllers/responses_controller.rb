class ResponsesController < ApplicationController
  def create
    poll = Poll.find params[:poll_id]
    response = build_response(poll)

    if response.save
      redirect_to polls_path
    else
      redirect_to poll_path poll
    end
  end

  private

  def build_response(poll)
    response = Response.new poll: poll
    poll.questions.each do |question|
      response.answers.build choice_id: params["question_#{question.id}"]
    end
    response
  end
end
