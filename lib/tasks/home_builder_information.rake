namespace :home_builder_information do
  desc 'Create objects for home builder functionality'
  task create: :environment do
    5.times do 
      Slider.create!()
    end
  end
end
