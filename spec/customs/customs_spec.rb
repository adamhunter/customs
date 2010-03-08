require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Customs do
  
  it "should read the given manifest file" do
    lambda { Customs.read_manifest(File.expand_path(File.dirname(__FILE__) + '/../fixtures/csv_to_ar.manifest')) }.should_not raise_exception
  end
  
  it "should raise Manifest::NotFound if there is no manifest file" do
    lambda { Customs.read_manifest('not_here.manifest') }.should raise_exception(Customs::Manifest::NotFound)
  end
  
  it "should add .manifest to the end of the file name if it is missing" do
    lambda { Customs.read_manifest(File.expand_path(File.dirname(__FILE__) + '/../fixtures/csv_to_ar')) }.should_not raise_exception
  end
  
end