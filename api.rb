require "sinatra"
require "datadog/statsd"

agent  = `ip route list match 0/0 | awk '{print $3}'`.chomp
statsd = Datadog::Statsd.new(agent, 8125)

get "/health" do
  UDPSocket.new.send 'mfine.page.views:1|c', 0, agent, 8125
  statsd.increment('mfine.health')
  status 200
end
