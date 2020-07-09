class SongSerializer < ActiveModel::Serializer
  attributes :id, :hour, :weather, :url
end
