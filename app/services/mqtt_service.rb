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
    # @client.subscribe( '#' )
    @client.get( 'owntracks/mario_e/marlin' ) do |topic, message|
      puts "#{topic}: #{message}"
    end
  end

end
