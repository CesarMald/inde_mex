module ModelsHelper

  def models_combo
    Model.all.map{ |model| [model.name.titleize, model.id] }
  end
end
