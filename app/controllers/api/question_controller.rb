class Api::QuestionController < ApiController

  def create
    @question = Question.new(question_params)
    if @question.save
      render json: {status: "success"}
    else
      render json: {status: "fail"}
    end
  end
  
  private
  
  def question_params
    params.require(:question).permit(:text, :answer, :test_id)
  end
end
