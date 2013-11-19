require "auctionet/client/version"
require 'open-uri'
require 'active_support/core_ext'
require 'auctionet/client/requester'

module Auctionet
  class Client
    def initialize(requester = Requester.new)
      @requester = requester
    end

    def fetch
      perform_request
    end

    def fetch_item id
      perform_request id
    end

    private

    attr_reader :requester

    def perform_request(param = nil)
      requester.perform(param)
    end
  end
end
