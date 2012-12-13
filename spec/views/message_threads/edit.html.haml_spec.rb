require 'spec_helper'

describe "message_threads/edit" do
  before(:each) do
    @message_thread = assign(:message_thread, stub_model(MessageThread))
  end

  it "renders the edit message_thread form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => message_threads_path(@message_thread), :method => "post" do
    end
  end
end
