class DocumentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :supplier_id, :expiryDate, :documentType, :supplier_document

  def supplier_document
    if object.supplier_document.attached?
      {
        url: rails_blob_url(object.supplier_document)
      }
    end
  end
end
