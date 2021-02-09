class DocumentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_document, only: [:show, :update, :destroy]

  def index
    @documents = current_user.documents
    if @documents != nil 
      render json: @documents
    end
  end

  def show
    render json: @document
  end

  def create
    @document = Document.new(supplier_id: params[:supplier_id], expiryDate: params[:expiryDate], documentType: params[:documentType], supplier_document: params[:supplier_document])
    @document.user_id = current_user.id
    if @document.save
      @document.supplier_document.attach(params[:supplier_document])
      render status: :created
    else
      render status: :bad_request
    end
  end

  def update
    if @document.update(supplier_id: params[:supplier_id], expiryDate: params[:expiryDate], documentType: params[:documentType], supplier_document: params[:supplier_document])
      @document.supplier_document.attach(params[:supplier_document])
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
    params.require(:document).permit(:supplier_id, :expiryDate, :documentType, :supplier_document, :supplier_name)
  end

  def set_document
    @document = Document.find(params[:id])
  end
end
