class PetsController < ApplicationController
  before_action :authenticate_user, only: [:create]
 
  def current_user
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end
 
  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end
 
  def index
    @pets = Pet.all
    render template: "pets/index"
  end
 
  def show
    @pet = Pet.find_by(id: params[:id])
    render template: "pets/show"
  end
  
  def create
    @pet = Pet.create(
      name: params[:name],
      age: params[:age],
      breed: params[:breed]
    )
    render json: {new: @pet}
  end
end
 