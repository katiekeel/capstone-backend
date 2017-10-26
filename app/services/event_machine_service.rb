# Setup EventMachine
Thread.new { EM.run  }

# Catch signals to ensure a clean shutdown of EventMachine
trap(:INT) { EM.stop }
trap(:TERM){ EM.stop }

# Wait for the reactor to start
while not EM.reactor_running?; end

# Setup done! Now you can use any EventMachine code here!

# Examples:
channel = EM::Channel.new
sub_id  = channel.subscribe { |msg| puts "Got: #{msg}" }

channel.push('hello world')
# => "Got: hello world"

# Clean up channel
channel.unsubscribe(sub_id)

# Will output the current time every second since it started
EM.add_timer(1) { puts "Executing timer: #{Time.now}" }

# Deferred blocks execute concurrently to the main thread
EM.defer { sleep 3; puts "It's been at least 3 seconds!" }

# Can even use EventMachine modules and code for async I/O
EM.system('ls') { |output,status| puts output }

# Tear-down, make sure that all EM defers finish
while not EM.defers_finished?; end
