class TankRelayJob < ApplicationJob
  def perform(tank)
    ActionCable.server.broadcast "tanks",
    tank: tank
  end
end
