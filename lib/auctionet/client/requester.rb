module Auctionet
  class Client
    class Requester
      def perform(param = nil)
        suffix = if param
                   "items/#{param}.json"
                 else
                   "items.json"
                 end
        data = open("https://auctionet.com/api/v2/" + suffix).read
        json_data = JSON.parse data
        json_data.values.first
      end
    end
  end
end
