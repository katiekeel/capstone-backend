class Tank < ApplicationRecord

  def self.update_tank(tank, level)
    find_by(number: tank)
  end

end
