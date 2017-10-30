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
  end

  def subscribe
    Thread.new do
      @client.get( 'a/b' ) do |tank, level|
        puts "#{tank}: #{level}"
        Tank.from_mqtt(tank, level)
        @client.disconnect()
      end
    end
  end

end
