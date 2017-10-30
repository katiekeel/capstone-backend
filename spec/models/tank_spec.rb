RSpec.describe Tank, type: :model do
  context "Validations" do
    describe "Attributes" do
      it {should validate_presence_of(:number)}
      it {should validate_presence_of(:level)}
    end
  end


  context "Methods" do
    scenario "from mqtt can take number and level and update or create" do
      tank = Tank.from_mqtt(1, 2)

      expect(tank.number).to eq "1"
      expect(tank.level).to eq "2"

      same_tank = Tank.from_mqtt(1, 3)
      byebug
      expect(same_tank.number).to eq "1"
      expect(same_tank.level).to eq "3"
    end
  end
end
