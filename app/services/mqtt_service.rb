class MqttService

  def initialize
    @client = MQTT::Client.connect(
      :host => 'm2m.eclipse.org',
      :port => 1883,
    )
  end

  def connect_to_broker
    @client.connect()
    subscribe
    receive
  end

  def subscribe
    @client.subscribe('DCML01')
    @client.subscribe('DCML02')
  end

  def receive
    Thread.new do
      @client.get do |tank, level|
        puts "#{tank}: #{level}"
        Tank.from_mqtt(tank, level)
      end
    end
  end

end
