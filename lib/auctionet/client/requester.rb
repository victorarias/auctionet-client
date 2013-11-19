module Auctionet
  class Client
    class Requester
      def perform(param = nil)
        suffix = if param
                   "items/#{param}.json"
                 else
                   "items.json"
                 end
        open("https://auctionet.com/api/v2/" + suffix).read
      end
    end
  end
end
