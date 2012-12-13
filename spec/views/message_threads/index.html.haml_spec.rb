require 'spec_helper'

describe "message_threads/index" do
  before(:each) do
    assign(:message_threads, [
      stub_model(MessageThread),
      stub_model(MessageThread)
    ])
  end

  it "renders a list of message_threads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
