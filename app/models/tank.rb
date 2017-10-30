class Tank < ApplicationRecord

  validates_presence_of :number, :level

  def self.from_mqtt(tank, level)
    find_or_create_by(number: tank) do |tank|
      tank.level = level
    end
  end

end
