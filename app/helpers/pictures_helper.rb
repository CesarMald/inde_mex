module PicturesHelper

  def image_label_for object
    if object.picture && object.picture.persisted?
      "Actualizar imagen"
    else
      "Subir imagen"
    end
  end
end
