class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[show update show_pos show_reviews documents]
  # get all POs, invoices and supplier contacts for current user
  def index
    suppliers = current_user.suppliers
    contacts = []
    purchase_orders = []
    reviews = []
    invoices = []
    if suppliers.length > 0
      suppliers.map do |supplier|
        contacts.push({ supplierName: supplier.name, contactName: supplier.contact_name,
                        contactEmail: supplier.contact_email })
        next unless supplier.purchase_orders.length > 0

        supplier.purchase_orders.map do |po|
          purchase_orders.push(po)
          reviews.push(po.review) unless po.review.nil?
          invoices.push(po.invoice) unless po.invoice.nil?
        end
      end
    end
    render json: { suppliers: suppliers, contacts: contacts, purchase_orders: purchase_orders, reviews: reviews,
                   invoices: invoices }
  end

  def show
    render json: @supplier
  end

  def show_reviews
    reviews = []
    invoices = []
    unless @supplier.purchase_orders.nil?
      @supplier.purchase_orders.map do |po|
        reviews.push(po.review) unless po.review.nil?
      end
    end
    render json: reviews 
  end

  def documents 
    render json: @supplier.documents
  end

  def create
    @supplier = Supplier.new(name: params[:name], service: params[:service], website: params[:website],
                             contact_email: params[:contact_email], contact_name: params[:contact_name], contact_number: params[:contact_number], description: params[:description], note: params[:note])
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
    if @supplier.update(name: params[:name], service: params[:service], website: params[:website],
                        contact_email: params[:contact_email], contact_name: params[:contact_name], contact_number: params[:contact_number], description: params[:description], note: params[:note])
      @supplier.logo.attach(params[:logo])
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
    params.require(:supplier).permit(:name, :service, :website, :contact_email, :contact_name, :contact_number,
                                     :description, :note, :logo)
  end
end
