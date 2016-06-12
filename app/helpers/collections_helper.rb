module CollectionsHelper

  def collections_combo
    Collection.all.map { |collection| [collection.name.titleize, collection.id]}
  end

end
