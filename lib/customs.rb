
module Customs
  
  def self.read_manifest(path = './customs.manifest')
    Customs::Base.new(normalize_path path)
  end
  
  private
    
    def self.normalize_path(path)
      path =~ /\.manifest$/ ? path : "#{path}.manifest" 
    end
  
end

require 'customs/base'
require 'customs/manifest'
require 'customs/adapter/active_record'
require 'customs/adapter/faster_csv'