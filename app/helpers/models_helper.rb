module ModelsHelper

  def models_combo
    Model.all.map{ |model| [model.name, model.id] }
  end
end
