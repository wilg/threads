require 'spec_helper'

describe "message_threads/new" do
  before(:each) do
    assign(:message_thread, stub_model(MessageThread).as_new_record)
  end

  it "renders new message_thread form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => message_threads_path, :method => "post" do
    end
  end
end
