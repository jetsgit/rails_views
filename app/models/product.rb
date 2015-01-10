class Product < ActiveRecord::Base
  belongs_to :publisher
  has_many :categorizations 
  has_many :categories, through: :categorizations 
  validates_presence_of :name, on: :create, message: "Must provide name"
  validates_presence_of :price, on: :create, message: "Price can't be blank"
end
