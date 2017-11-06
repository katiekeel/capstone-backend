RSpec.describe "MQTT Service" do
  scenario "has client state upon initialization" do
    service = MqttService.new

    expect(service.client.class).to eq MQTT::Client
    expect(service.client.remote_host).to eq 'm2m.eclipse.org'
    expect(service.client.remote_port).to eq 1883
    expect(service.client.reconnect).to eq true
  end

  # library is a bit of a black box so not sure
  # how to how to appropriately test the following
  # just making sure no errors are produced

  scenario "can connect to broker" do
    service = MqttService.new

    service.connect_to_broker
  end

  scenario "can subscribe" do
    service = MqttService.new

    service.subscribe
  end

  scenario "can receive" do
    service = MqttService.new

    service.receive
  end
end
