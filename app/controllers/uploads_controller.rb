class UploadsController < ApplicationController
  def new
    @upload = Upload.new
  end
  def index
    @upload = Upload.all
  end

  def create #primer metodo creado
  	@upload = Upload.create(upload_params)
  	if @upload.save
  		render json: {message:"success", fileId: @upload.id}, :status => 200
  	else
  		render json: {message: @upload.errors.full_messages.join(',')}, :status => 400
  	end
  end
  def destroy
    @upload = Upload.find(params[:id])
    if @upload.destroy
      redirect_to action: "index"
    else
      reder json: {message: @upload.errors.full_messages.join(',')}
    end
  end

  private
  def upload_params #segundo metodo creado
  	params.require(:upload).permit(:image) #aqui decimos que solo permita imagenes

  end

end
