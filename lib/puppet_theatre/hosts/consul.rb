require 'diplomat'

module PuppetTheatre
  module Hosts
    class Consul < Base

      def each
        Diplomat.configure { | c | c.url = config.fetch(:consul_url, 'http://localhost') }
        Diplomat::Node.get_all(dc: config.fetch(:datacenter)).each do |node|
          yield node.Node
        end
      end
    end
  end
end
