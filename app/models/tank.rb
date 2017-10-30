class Tank < ApplicationRecord

  def self.from_mqtt(tank, level)
    find_or_create_by(number: tank) do |tank|
      tank.level = level
    end
  end

end
