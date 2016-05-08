namespace :basic_information do
  desc 'Creates basic objects'
  task create: :environment do
    # Brands
    ["Motorola", "Apple", "LG", "Samsung"].each do |brand_name|
      Brand.create!(name: brand_name)
    end
    # Models
    models = ["Iphone 6", "S6 EDGE", "iphone 4 / 4s", "iphone 5 / 5s", "iphone 5c"]
    models.each do |model|
     Brand.find_by(name: "Apple").models.create(name: model)
    end

    models = ["g3", "g3 stylus", "g4 stylus", "magna"]
    models.each do |model|
      Brand.find_by(name: "LG").models.create(name: model)
    end
    
    models = ["moto g", "moto g2", "moto g3", "moto x force", "moto x play"]
    models.each do |model|
      Brand.find_by(name: "Motorola").models.create(name: model)
    end

    models = ["galaxy s4", "galaxy s5", "galaxy s6", "galaxy s6 edge", "s6 edge plus"]
    models.each do |model|
      Brand.find_by(name: "Samsung").models.create(name: model)
    end

    # Collections
    collections = ["cargadores domésticos", "cargadores para autos", "protectores de pantalla", "carcasas", "fundas de uso rudo", "fundas gummy tuff", "cables, datos y audio", "funda cartera"]
    collections.each do |collection|
      Collection.create(name: collection, text_link: "#buscandomiestilo")
    end
     
  end
end

namespace :home_builder_information do
  desc 'Create objects for home builder functionality'
  task create: :environment do
    # Main slider
    5.times do 
      Slider.create!(title: "Sleek, Intuitive & Performant, It's your design toolkit.", description: "Build beautiful, contemporary sites in just moments with Foundry and Variant Page Build", link_text: "Start exploring", url_link: "google.com" )
    end

    # Brands section
    slider_brand = SliderBrand.create!(name: "#MYBRAND", description: "Escoge tu marca de tu equipo, elige tu modelo y empieza a comprar." )
    slider_brand.items.create!(brand_id: Brand.first.id, url_link: "google.com")

    # Complete banners
    Banner.create!(position: "first", title: "tpu mickey y minnie mouse para iphone 6", description: "Si yo fuera tu igual y se lo compro a mi novia, total
dura más que un ramo de flores...#todoPorAmor.", link_url: "google.com", link_text: "Just get it", hover_title: "Lorem Ipsum Atom", hover_description: "generando reacciones, compartiendo tu estilo")
    Banner.create!(position: "second", title: "Cargador para iphone 5 y modelos posteriores", description: "Disponible en varios colores, busca el que mas vaya con tu estilo #idenmexMyStyle", link_url: "google.com", link_text: "Book a tour", hover_title: "lorem ipsum atom", hover_description: "generando reacciones, compartiendo tu estilo")
    
    # half-size banners
    Banner.create!(position: "third", title: "¿quieres vender nuestros productos", description: "Inscríbete con nosotros y empieza ahora mismo tu propio negocio, es fácil y rápido, solo haz click", link_url: "google.com", link_text: "", hover_title: "Lorem Ipsum Atom", hover_description: "generando reacciones, compartiendo tu estilo", banner_type: "half")

    Banner.create!(position: "fourth", title: "Cartera para iphone6/iphone 6s", description: "Disponible también para otros modelos haz click y busca el tuyo", link_url: "google.com", link_text: "", hover_title: "loremp ipsum atom", hover_description: "generando reacciones, compartiendo tu estilo", banner_type: "half")
  end

  desc 'Delete objects for home builder functionality'
  task delete: :environment do
    Slider.destroy_all
    SliderBrand.destroy_all
    Banner.destroy_all
  end
end
