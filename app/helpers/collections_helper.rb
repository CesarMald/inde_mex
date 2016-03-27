module CollectionsHelper

  def collections_combo
    Collection.all.map { |collection| [collection.name, collection.id]}
  end
end
