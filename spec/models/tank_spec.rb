RSpec.describe Tank, type: :model do
  context "Validations" do
    describe "Attributes" do
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:level)}
    end
  end


  context "Methods" do
    scenario "from mqtt can take number and level and update or create" do
      tank = Tank.from_mqtt("A", 2)

      expect(tank.name).to eq "A"
      expect(tank.level).to eq 2

      tank = Tank.from_mqtt("A", 3)

      expect(tank.name).to eq "A"
      expect(tank.level).to eq 3
    end
  end
end
