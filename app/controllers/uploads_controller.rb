class UploadsController < ApplicationController
  def new
  end

  def create #primer metodo creado
  	@upload = Uploads.create(upload_params)
  	if @upload.save
  		render json: {message:"success"}, :status => 200
  	else
  		render json: {message: @upload.errors.full_messages.join(',')}, :status => 400
  	end
  end

  private
  def upload_params #segundo metodo creado
  	params.require(:uploads).permit(:image) #aqui decimos que solo permita imagenes
  	
  end

end
