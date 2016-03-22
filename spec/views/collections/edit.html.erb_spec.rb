require 'rails_helper'

RSpec.describe "collections/edit", type: :view do
  before(:each) do
    @collection = assign(:collection, Collection.create!(
      :title => "MyString",
      :description => "MyString",
      :text_link => "MyString",
      :url_link => "MyString"
    ))
  end

  it "renders the edit collection form" do
    render

    assert_select "form[action=?][method=?]", collection_path(@collection), "post" do

      assert_select "input#collection_title[name=?]", "collection[title]"

      assert_select "input#collection_description[name=?]", "collection[description]"

      assert_select "input#collection_text_link[name=?]", "collection[text_link]"

      assert_select "input#collection_url_link[name=?]", "collection[url_link]"
    end
  end
end
