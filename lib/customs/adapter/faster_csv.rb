require 'faster_csv'

module Customs
  module Adapter
    module FasterCSV
  
      def import
        FasterCSV.open("#{Time.now.to_i}.csv", 'w') do |csv|
          @@manifest.importer.export.each do |row|
            csv << manifest.translate(self, row).sort.collect { |a| a[1] }
          end
        end
      end
    
      def export
        FasterCSV.read(@@connection)
      end
    
      def customize(manifest, connection)
        @@manifest, @@connection = manifest, connection
      end
    
    end
  end
end

FasterCSV.send :extend, Customs::Adapter::FasterCSV