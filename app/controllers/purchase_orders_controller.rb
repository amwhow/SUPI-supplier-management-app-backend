class PurchaseOrdersController < ApplicationController
  def index 
    # should be current_user.purchage_orders
    purchase_orders = PurchaseOrder.all
    render json: purchase_orders
  end

  def show 
    render json: @purchase_order
  end 

  def create 
    purchase_order = PurchaseOrder.new(purchase_orders_params)
    # a purchase_order can engage with different users/companies
    purchase_order.user_id = current_user.id   
    if purchase_order.save
      render status: :created 
    else
      render status: :bad_request
    end
  end

  def update 
    if @purchase_order.update(purchase_orders_params)
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
    params.require(:purchase_order).permit(:name, :service, :website, :contact_email, :contact_name, :contact_number, :description, :note, :user_id, :PO_document)
  end
end
