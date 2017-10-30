class Tank < ApplicationRecord

  validates_presence_of :number, :level

  def self.from_mqtt(tank, level)
    tank = self.find_or_create_by!(number: tank) do |tank|
      tank.level = level
    end
    tank.update_attributes!(level: level)
    tank
  end

end
