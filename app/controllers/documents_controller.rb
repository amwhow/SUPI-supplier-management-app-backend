class DocumentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_document, only: [:show, :update, :destroy]

  def index
    @documents = current_user.Document.all
    render json: @documents
  end

  def show
    render json: @document
  end

  def create
    @document = Document.new(document_params)
    @document.user_id = current_user.id
    if @document.save
      render status: :created
    else
      render status: :bad_request
    end
  end

  def update
    if @document.update(document_params)
      render status: :no_content
    else
      render status: :bad_request
    end
  end

  def destroy
    @document.destroy
  end

  private

  def document_params
    params.require(:document).permit(:user_id, :supplier_id, :expiryDate, :documentType, :supplier_document)
  end

  def set_document
    @document = Document.find(params[:id])
  end
end
