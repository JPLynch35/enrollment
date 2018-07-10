class Address < ApplicationRecord
  belongs_to :student
  validates_presence_of :description, :street, :city, :state, :zipcode
  
end