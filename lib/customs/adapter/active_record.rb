require 'active_record'

module Customs
  module Adapter
    module ActiveRecord
    
      def import
        manifest.importer.export.each do |row|
          record = new(manifest.translate(self, row))
          record.save
        end
      end
    
      def export
        all.collect { |a| a.attributes }
      end
    
      def customize(manifest, connection)
        connection = YAML.load_file(connection) unless connection.is_a?(Hash)
        establish_connection connection
        self.manifest = manifest
      end
    
    end
  end
end

ActiveRecord::Base.send :class_inheritable_accessor, :manifest
ActiveRecord::Base.send :extend, Customs::Adapter::ActiveRecord