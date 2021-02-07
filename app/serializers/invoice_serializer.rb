class InvoiceSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :purchase_order_id, :receivedDate, :dueDate, :totalPrice, :paid, :invoice_document

  def invoice_document
    if object.invoice_document.attached?
      {
        url: rails_blob_url(object.invoice_document)
      }
    end
  end
end
