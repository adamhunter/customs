module Customs
  class Base
    
    attr_accessor :manifest
    
    def initialize(path)
      @manifest = Customs::Manifest.load(path)
    end
    
    def import
      @manifest.exporter.import
    end
    
    def export
      @manifest.importer.import
    end
    
  end
end