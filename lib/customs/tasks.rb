namespace :customs do
  
  desc "Import specified manifest, usage: rake customs:import[path/to/manifest]"
  task :import do |path|
    Customs.read_manifest(path).import
  end
  
  desc "Export specified manifest, usage: rake customs:export[path/to/manifest]"
  task :export do |path|
    Customs.read_manifest(path).export
  end
  
end