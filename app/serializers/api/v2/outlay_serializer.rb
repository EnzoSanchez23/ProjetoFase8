class Api::V2::OutlaySerializer < ActiveModel::Serializer
  attributes :id, :description, :value, :date, :user_id, :created_at, :updated_at
end
