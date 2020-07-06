class CritterSerializer < ActiveModel::Serializer
  attributes :id, :category, :name, :img_url
end
