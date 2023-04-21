class OrderItemsController < ApplicationController
    before_action :set_order_item, only: %i[update destroy]
    before_action :set_categories

    def create
        order_item = current_order.order_items.find_by(product_id: params[:product_id])
        if params[:name] == 'minus'
            if order_item && order_item.quantity == 1
                order_item.destroy
            elsif order_item && order_item.quantity > 1
                order_item.quantity -= 1
                order_item.save
            else
                current_order.order_items.create(product_id: params[:product_id])
            end
        elsif order_item
            order_item.quantity += 1
            order_item.save
        else
            current_order.order_items.create(product_id: params[:product_id])
        end
        redirect_to current_order
    end

    def destroy
        @order_item.destroy
        redirect_to root_path
    end

    private

    def order_params
        params.require(:order_item).permit(:quantity, :product_id)
    end

    def set_order_item
        @order_item = OrderItem.find(params[:id])
    end

    def set_categories
        @categories = Category.all
    end
end