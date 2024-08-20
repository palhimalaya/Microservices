require 'bunny'

RABBITMQ_CONNECTION = Bunny.new(hostname: 'localhost')
RABBITMQ_CONNECTION.start

at_exit do
  RABBITMQ_CONNECTION.close
end