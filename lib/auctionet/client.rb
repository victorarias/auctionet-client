require "auctionet/client/version"
require 'open-uri'
require 'json'
require 'active_support/core_ext'
require 'auctionet/client/requester'

module Auctionet
  class Client
    def initialize(requester = Requester.new)
      @requester = requester
    end

    def fetch
      data = JSON.parse perform_request
      clear_data(data)
    end

    def fetch_item id
      data = JSON.parse perform_request id
      clear_data(data)
    end

    private

    attr_reader :requester

    def clear_data(data)
      data.values.first
    end

    def perform_request(param = nil)
      requester.perform(param)
    end
  end
end
