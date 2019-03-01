class Product < ApplicationRecord
	belongs_to :category
	validates_presence_of :name, :price
	validates_numericality_of :price, :message=>"Error message"
end
