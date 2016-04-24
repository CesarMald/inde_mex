module SliderBrandsHelper

  def link_to_add_brands name, f, css_class 
    new_object = f.object.send("items").klass.new
    new_object.build_picture
    id = new_object.object_id
    fields = f.fields_for("items", new_object, child_index: id) do |builder|
      render("slider_item_fields", f: builder, item: new_object, number: 1)
    end
    link_to(name, "#", class: "add_brand_fields #{css_class}", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
