class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_name, :email, :password, :password_confirmation, :company_name

  def logo
    if object.logo.attached?
      {
        url: rails_blob_url(object.logo)
      }
    end
  end
end
