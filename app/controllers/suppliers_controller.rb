class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :update, :show_pos]

  def index 
    # should be current_user.suppliers
    @suppliers = current_user.suppliers
    render json: @suppliers
  end

  def show 
    render json: @supplier
  end 
  
  def show_pos 
    reviews = []
    invoices = []
    @supplier.purchase_orders.map do |po| 
      reviews.push(po.review) 
      invoices.push(po.invoice) 
    end
    render json: { pos: @supplier.purchase_orders, reviews: reviews, invoices: invoices }
  end 

  def create 
    @supplier = Supplier.new(name: params[:name], service: params[:service], website: params[:website], contact_email: params[:contact_email], contact_name: params[:contact_name], contact_number: params[:contact_number], description: params[:description], note: params[:note])
    # a supplier can engage with different users/companies
    @supplier.user_id = current_user.id   
    if @supplier.save
      @supplier.logo.attach(params[:logo])
      render status: :created 
    else
      render status: 400
    end
  end

  def update 
    if @supplier.update(supplier_params)
      render status: :no_content 
    else 
      render status: :bad_request
    end
  end

  def destroy 
    @supplier.destroy
  end

  private 

  def set_supplier 
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params 
    params.require(:supplier).permit(:name, :service, :website, :contact_email, :contact_name, :contact_number, :description, :note, :logo)
  end

end
