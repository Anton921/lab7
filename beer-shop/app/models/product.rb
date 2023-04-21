class Product < ApplicationRecord
  belongs_to :category
  has_many :comments

  def self.title_clasick
    Product.order(:title)
  end

  def self.title_back
    Product.order(title: :desc)
  end

  def self.price_low
    Product.order(:price)
  end

  def self.price_high
    Product.order(price: :desc)
  end

  def to_param
    "#{self.id}-#{self.title}"
  end

  def rating
    return 0 if comments.empty?
    comments.sum(&:rating).to_f / comments.count
  end
  
end