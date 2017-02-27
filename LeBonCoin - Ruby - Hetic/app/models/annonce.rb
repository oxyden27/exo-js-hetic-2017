class Annonce < ActiveRecord::Base
    belongs_to :category
    belongs_to :user
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
    validates :title, presence: true, length: { in: 6..40 }
    validates :price, presence: true
    validates :description, presence: true, length: { in: 4..400 }
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
