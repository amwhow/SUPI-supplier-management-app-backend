class PurchaseOrderSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :orderDate, :approvalStatus, :totalPrice, :delivered, :supplier_id, :po_document

  def po_document
    if object.po_document.attached?
      {
        url: rails_blob_url(object.po_document)
      }
    end
  end
end
