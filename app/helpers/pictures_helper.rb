module PicturesHelper

  def image_label_for object
    if object.picture && object.picture.persisted?
      "Actualizar imagen"
    else
      "Subir imagen"
    end
  end

  def slider_class object
    if (object.is_a? Model) || (object.is_a? SliderBrandItem)
      "slider_container_m"
    end
  end
end
