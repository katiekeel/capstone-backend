# TankData

This project pulls real-life IoT sensor data from an MQTT broker and displays it to the user with React and HighCharts.

* Production backend is [here](https://katie-keel-capstone-backend.herokuapp.com/api/v1/tanks)
* Production frontend is [here](https://katie-keel-capstone-frontend.herokuapp.com/)
* Frontend repo is [here](https://github.com/katiekeel/capstone-frontend)

This app was built with the help of my mentors at the Turing School of Software and Design, as well as others in the community.

## Backend info

This Rails API app spins up a connection to an MQTT broker site (Eclipse M2M) on server start. It keeps the connection open using `Thread.new` in order to not block the Rails process.

Messages from the broker have a tank name/id and a level/% full datapoint. When new messages arrive, Rails:  

1. updates the record in the tanks table based on the tank name and level  
2. sends a background worker to broadcast the new data over the ActionCable socket
3. tells ActionCable to broadcast the new data when there are sufficient resources (usually instantaneously).

The data stream can also be accessed by the normal api/v1/etc. system. The current frontend implements this method.

## Contributing

Potential areas of help:

* a better solution than `Thread.new` for concurrency in Rails - a background worker didn't seem correct for keeping a connection open, and EventMachine appears to be somewhat outdated. Right now it works, but if we start to receive large volumes of messages, this solution won't hold.  
* Testing ActionCable - apparently this isn't really yet a thing, but I'd love ideas.

To get set up:

`$ git clone git@github.com:katiekeel/capstone-backend.git your-directory`  
`$ cd your-directory`  
`$ bundle`
`$ rails s`

And, in a separate tab:

`$ redis-server`

Note: you'll need to have Redis installed on your system as well. More information [here](https://redis.io/download).

## Further information and architecture decision resources:

* Excellent blog post series on MQTT basics [here](https://www.hivemq.com/blog/mqtt-essentials/).
  - I found parts 2-4 and 6 especially helpful as a beginner.
* Tutorial I followed to use MQTT in Rails [here](http://blog.mallow-tech.com/2016/11/iot-in-rails-with-aws-mqtt/).
