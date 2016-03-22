require 'rails_helper'

RSpec.describe "collections/index", type: :view do
  before(:each) do
    assign(:collections, [
      Collection.create!(
        :title => "Title",
        :description => "Description",
        :text_link => "Text Link",
        :url_link => "Url Link"
      ),
      Collection.create!(
        :title => "Title",
        :description => "Description",
        :text_link => "Text Link",
        :url_link => "Url Link"
      )
    ])
  end

  it "renders a list of collections" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Text Link".to_s, :count => 2
    assert_select "tr>td", :text => "Url Link".to_s, :count => 2
  end
end
