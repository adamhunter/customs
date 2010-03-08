module Customs
  class Manifest
    
    attr_accessor :importer, :exporter
    
    def self.load(path)
      raise Customs::Manifest::NotFound.new "Manifest could not be found in #{path}" unless FileTest.exists?(path)
      Kernel.load path
    end
    
    def initialize(&block) 
      @manifest = instance_exec(&block)
    end

    def import(*args)
      @importer = agent(*args)
    end
    
    def export(*args)
      @exporter = agent(*args)
    end
    
    def agent(klass, connection, options = {})
      klass.customize(self, connection)
      klass
    end
    
    # todo: find a way to get "to" automatically
    def translate(to, values)
      if to.class == @importer
        key, val = 0, 1
      elsif to.class == @exporter
        key, val = 1, 0
      else
        raise Customs::Manifest::NoTranslationFound.new "No translation was found for #{to.class}"
      end
      @manifest.inject({}) { |hash, map| hash.merge(map[key] => values[map[val]]) }
    end
   
   class NotFound < StandardError ; end
   class NoTranslationFound < StandardError ; end
   
  end
end

def customs(&block) 
  Customs::Manifest.new(&block)
end
