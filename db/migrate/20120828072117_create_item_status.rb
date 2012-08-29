# class CreateItemStatus < ActiveRecord::Migration
#   def self.up
#     add_column :list_items, :complete, :boolean, :default => false, :null => false
#   end
# 
#   def self.down
#     remove_column :list_items, :complete
#   end
# end