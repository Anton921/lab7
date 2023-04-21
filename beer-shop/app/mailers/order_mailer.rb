class OrderMailer < ApplicationMailer
    def place_an_order
        @user = params[:user]
        @order = params[:order]
        mail(to: @user.email, subject: 'Your order list from Beer-Shop')
    end
end
