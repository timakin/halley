require 'spec_helper'

describe "databoxes/new" do
  before(:each) do
    assign(:databox, stub_model(Databox,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new databox form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", databoxes_path, "post" do
      assert_select "input#databox_title[name=?]", "databox[title]"
      assert_select "textarea#databox_description[name=?]", "databox[description]"
    end
  end
end
