class Item < ApplicationRecord
  belongs_to :category
  has_attached_file :image, styles: { large:"600x600>",medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates:name, presence: true,length: {minimum: 3, maximum: 50}
  validates:description, presence: true,length: {minimum: 10, maximum: 1000}
  validates:price, presence: true,numericality: {greater_than: 0}
end
