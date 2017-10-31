class Tank < ApplicationRecord

  validates_presence_of :name, :level

  after_commit { TankRelayJob.perform_later(self) }

  def self.from_mqtt(name, level)
    tank = self.find_or_create_by!(name: name) do |tank|
      tank.level = level.to_i
    end
    tank.update_attributes!(level: level.to_i)
    tank
  end

end
