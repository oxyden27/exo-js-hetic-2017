class Category < ActiveRecord::Base
   has_many :annonces
   validates :name, length: { in: 3..20 }, presence: true
   
end
