class Api::ActiveTestController < ApiController
  def index
    @tests = Test.all
    render 'index', formats: 'json', handlers: 'jbuilder'
  end
  
  def create
    @test = Test.new(name: params[:name])
    if @test.save
      render json: {status: "success #{@test.name} was added"}
    else
      render json: {status: "fail"}
    end
  end

  def show
    @test = Test.eager_load(:questions).find(params[:id])
    render 'show', formats: 'json', handlers: 'jbuilder'
  end
end
