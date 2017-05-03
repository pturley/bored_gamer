namespace :db do
  namespace :seed do

    desc 'Import data from BGG'
    task import_data: :environment do
      xml_files = Dir.glob("#{Rails.root}/tmp/xmls/*xml")
      BggImporter.new.import(xml_files)
    end
  end
end
