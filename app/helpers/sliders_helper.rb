module SlidersHelper

  def image_label_for_slider slider
    slider.picture ? "Actualizar imagen:" : "Subir imagen:"
  end
end
