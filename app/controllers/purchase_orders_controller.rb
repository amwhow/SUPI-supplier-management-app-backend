class PurchaseOrdersController < ApplicationController
  def index 
    # should be current_user.purchage_orders
    @purchase_orders = current_user.purchase_orders
    render json: @purchase_orders
  end

  def show 
    render json: @purchase_order
  end 

  def create 
    @purchase_order = PurchaseOrder.new(orderDate: params[:orderDate], approvalStatus: params[:approvalStatus], totalPrice: params[:totalPrice], delivered: params[:delivered], supplier_id: params[:supplier_id])
    # a purchase_order can engage with different users/companies
    @purchase_order.user_id = current_user.id   
    if @purchase_order.save
      @purchase_order.po_document.attach(params[:po_document])
      render status: :created 
    else
      render status: :bad_request
    end
  end

  def update 
    if @purchase_order.update(purchase_order_params)
      render status: :no_content 
    else 
      render status: :bad_request
    end
  end

  def destroy 
    @purchase_order.destroy
  end

  private 

  def set_purchase_order 
    @purchase_order = PurchaseOrder.find(params[:id])
  end

  def purchase_order_params 
    params.require(:purchase_order).permit(:orderDate, :approvalStatus, :totalPrice, :delivered, :supplier_id, :PO_document)
  end
end
