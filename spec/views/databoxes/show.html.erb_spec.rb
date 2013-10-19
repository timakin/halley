require 'spec_helper'

describe "databoxes/show" do
  before(:each) do
    @databox = assign(:databox, stub_model(Databox,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
