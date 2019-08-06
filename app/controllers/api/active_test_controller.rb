class Api::ActiveTestController < ApiController
  def index
    @tests = Test.all
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
  
  def create
  end

  def show
  end
end
