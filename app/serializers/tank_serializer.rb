class TankSerializer < ActiveModel::Serializer
  attributes :id, :name, :level, :updated_at
end
