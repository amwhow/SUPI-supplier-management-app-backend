class SupplierSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :service, :website, :contact_email, :contact_name, :contact_number, :description, :note, :logo

  def logo
    if object.logo.attached?
      {
        url: rails_blob_url(object.logo)
      }
    end
  end
end
