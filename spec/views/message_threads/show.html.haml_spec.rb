require 'spec_helper'

describe "message_threads/show" do
  before(:each) do
    @message_thread = assign(:message_thread, stub_model(MessageThread))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
