class BirdsController < ApplicationController
  #doing this for wrap parameters  for this controller but for overall controllers go tothe config folder with the wrap parameters.
   wrap_parameters format: []

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

    # GET /birds/:id
    def show
      bird = Bird.find_by(id: params[:id])
      if bird
        render json: bird
      else
        render json: { error: "Bird not found" }, status: :not_found
      end
    end

  # POST /birds
  def create
    # bird = Bird.create(name: params[:name], species: params[:species])
    
    #>>>>>>>>>>>>>>>>>
    #this is one way of doing it. using strong params
    
    # bird = Bird.create(params.permit(:name, :species))

    #>>>>>>>>>>>>>>>>>>>>>>>>>>>

    #Refactoring params

    bird = Bird.create(bird_params)

byebug 
    render json: bird, status: :created
  end

  private
    def bird_params
      params.permit(:name, :species)
    end


end
