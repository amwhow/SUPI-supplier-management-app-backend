class SuppliersController < ApplicationController
  def index 
    # should be current_user.suppliers
    @suppliers = Supplier.all
    puts @suppliers
    render json: @suppliers
  end

  def show 
    render json: @supplier
  end 

  def create 
    @supplier = Supplier.new(supplier_params)
    # a supplier can engage with different users/companies
    @supplier.user_id = current_user.id   
    if @supplier.save
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
