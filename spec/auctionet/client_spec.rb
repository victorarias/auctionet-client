require 'spec_helper'
require 'auctionet/client'

describe Auctionet::Client do
  subject(:client) { Auctionet::Client.new(requester) }
  let(:requester) { requester = double("requester", perform: payload) }

  describe "#fetch" do
    let(:payload) { { "items" => [ {} ] }.to_json }

    it "fetch items" do
      expect(client.fetch.size).to be > 0
    end

    it "returns an array" do
      expect(client.fetch).to be_kind_of(Array)
    end
  end

  describe "#fetch_item" do
    let(:payload) { { "item" => { "id" => 1 } }.to_json }

    it "fetch a single item" do
      expect(client.fetch_item(1)).to_not be_nil
    end

    it "returns the right item" do
      requester.should_receive(:perform).with(1)
      item = client.fetch_item(1)
      expect(item["id"]).to be 1
    end
  end
end
