require "sinatra"
require "datadog/statsd"

statsd = Datadog::Statsd.new('localhost', 8125)

get "/health" do
  r = statsd.increment('dogpatch.health')
  puts r
  status 200
end
