class CritterSerializer < ActiveModel::Serializer
  attributes :id, :category, :name, :img_url, :nh_available_months, :sh_available_months, :available_times
end
