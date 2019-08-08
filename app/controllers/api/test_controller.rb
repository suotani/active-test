class Api::TestController < ApiController

  def index
    @questions = Question.where(test_id: params[:test_ids]).to_a.shuffle
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
