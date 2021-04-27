class PurchaseOrdersController < ApplicationController
  before_action :authenticate_user
  before_action :set_purchase_order, :set_purchase_orders_supplier, :set_invoice_supplier, only: %i[show update destroy supplier supplier_invoice]

  def index
    # should be current_user.purchase_orders
    @purchase_orders = current_user.purchase_orders
    render json: @purchase_orders
  end

  def show
    po_doc = rails_blob_path(@purchase_order.po_document)
    render json: { po: @purchase_order, file: po_doc }
  end

  def supplier
    # render json: { po: @purchase_orders_supplier, invoice: @invoice_supplier }
    render json: @purchase_orders_supplier
  end

  def supplier_invoice 
    render json: @invoice_supplier
  end

  def create
    @purchase_order = PurchaseOrder.new(orderDate: params[:orderDate], approvalStatus: params[:approvalStatus],
                                        totalPrice: params[:totalPrice], delivered: params[:delivered], supplier_id: params[:supplier_id])
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
    if @purchase_order.update(orderDate: params[:orderDate], approvalStatus: params[:approvalStatus],
                              totalPrice: params[:totalPrice], delivered: params[:delivered], supplier_id: params[:supplier_id])
      @purchase_order.po_document.attach(params[:po_document])
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

  def set_purchase_orders_supplier
    @purchase_orders_supplier = PurchaseOrder.where("supplier_id = #{params[:id]}")
  end
  
  def set_invoice_supplier
    po_ids = []
    @purchase_orders_supplier.each {|po| po_ids.push(po.id)}
    # @invoice_supplier = @purchase_orders_supplier.map { |element| element.invoice }
    invoice_all = Invoice.all
    @invoice_supplier = invoice_all.where(purchase_order_id:po_ids)
  end

  def purchase_order_params
    params.require(:purchase_order).permit(:orderDate, :approvalStatus, :totalPrice, :delivered, :supplier_id,
                                           :PO_document)
  end
end
