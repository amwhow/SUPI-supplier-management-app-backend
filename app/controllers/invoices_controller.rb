class InvoicesController < ApplicationController
  before_action :authenticate_user
  before_action :set_invoice, only: [:show, :update, :destroy]
  
  def index
    @invoices = current_user.invoices
    render json: @invoices
  end

  def show
    render json: @invoice
  end

  def create
    @invoice = Invoice.new(purchase_order_id: params[:purchase_order_id], receivedDate: params[:receivedDate], dueDate: params[:dueDate], totalPrice: params[:totalPrice], paid: params[:paid], invoice_document: params[:invoice_document])
    @invoice.user_id = current_user.id
    if @invoice.save
      render status: :created
    else
      render status: :bad_request
    end
  end

  def update
    if @invoice.update(invoice_params)
      render status: :no_content
    else
      render status: :bad_request
    end
  end

  def destroy
    @invoice.destroy
  end

  private

  def invoice_params
    params.require(:invoice).permit( :purchase_order_id, :receivedDate, :dueDate, :totalPrice, :paid, :invoice_document)
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end
