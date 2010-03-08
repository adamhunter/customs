require 'rubygems'
require 'active_record'
require 'business'
ActiveRecord::Base.establish_connection(YAML.load_file('./database.yml'))

class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :contact
      t.string :value
      
      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end

CreateBusinesses.up