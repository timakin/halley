require 'spec_helper'

describe "databoxes/edit" do
  before(:each) do
    @databox = assign(:databox, stub_model(Databox,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit databox form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", databox_path(@databox), "post" do
      assert_select "input#databox_title[name=?]", "databox[title]"
      assert_select "textarea#databox_description[name=?]", "databox[description]"
    end
  end
end
