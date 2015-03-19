require 'spec_helper'

describe Uber::Client do
  let(:client) { Uber::Client.new(token: "123") }
  let(:sandbox_client) { Uber::Client.new(token: "123", sandbox: true) }

  it "points to production by default" do
    expect(client.sandbox).to be(false)
    expect(client.class.base_uri).to eq(Uber::Client::NONSANDBOX_URI)
  end

  it "points to sandbox in sandbox mode" do
    expect(sandbox_client.sandbox).to be(true)
    expect(sandbox_client.class.base_uri).to eq(Uber::Client::SANDBOX_URI)
  end
end
