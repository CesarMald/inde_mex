module CollectionsHelper

  def collections_combo
    Collection.all.map { |collection| [collection.name.titleize, collection.id]}
  end

  def collection_position index
    if index % 2 == 0
      "text-right"
    else
      "text-left"
    end
  end

end
