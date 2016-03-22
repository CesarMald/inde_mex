require 'rails_helper'

RSpec.describe "collections/new", type: :view do
  before(:each) do
    assign(:collection, Collection.new(
      :title => "MyString",
      :description => "MyString",
      :text_link => "MyString",
      :url_link => "MyString"
    ))
  end

  it "renders new collection form" do
    render

    assert_select "form[action=?][method=?]", collections_path, "post" do

      assert_select "input#collection_title[name=?]", "collection[title]"

      assert_select "input#collection_description[name=?]", "collection[description]"

      assert_select "input#collection_text_link[name=?]", "collection[text_link]"

      assert_select "input#collection_url_link[name=?]", "collection[url_link]"
    end
  end
end
