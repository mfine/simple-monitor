require "sinatra"
require "datadog/statsd"

statsd = Datadog::Statsd.new('localhost', 8125)

get "/health" do
  statsd.increment('dogpatch.health')
  status 200
end
