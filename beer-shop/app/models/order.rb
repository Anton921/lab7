class Order < ApplicationRecord
    has_many :order_items
    belongs_to :user
    has_many :products, through: :order_items

    enum status: %i[in_progress ordered]

    def full_price
        order_items.map(&:total_price).sum
    end
end