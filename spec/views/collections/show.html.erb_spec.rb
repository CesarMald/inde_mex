require 'rails_helper'

RSpec.describe "collections/show", type: :view do
  before(:each) do
    @collection = assign(:collection, Collection.create!(
      :title => "Title",
      :description => "Description",
      :text_link => "Text Link",
      :url_link => "Url Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Text Link/)
    expect(rendered).to match(/Url Link/)
  end
end
