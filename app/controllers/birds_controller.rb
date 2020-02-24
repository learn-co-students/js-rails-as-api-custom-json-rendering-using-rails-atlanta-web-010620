class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds, only: [:id, :name, :species]
    # or: render json: birds, except: [:created_at, :updated_at]

  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    # render json: bird.slice(:id,:name,:species)
    # render json: bird, only: [:id, :name, :species]

    # error handing: 

    if bird 
      render json: bird, only: [:id, :name, :species]
    else 
      render json: {message: "bird not found!"}
    end

  end
end