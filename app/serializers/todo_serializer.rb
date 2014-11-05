class TodoSerializer < ActiveModel::Serializer
  attributes :id, :completed, :title, :order
end
