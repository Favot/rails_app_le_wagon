class QuestionsController < ApplicationController
  def ask; end

  def answer
    @question = params[:question]

    @answer = coach_answer(@question) if @question
  end

  private

  def coach_answer(your_message)
    right_answer = 'I am going to work right now!'

    if right_answer == your_message
      'Great!'
    elsif your_message.include? '?'
      'Silly question, get dressed and go to work!'
    else
      "I don't care, get dressed and go to work!"
    end
  end
end
