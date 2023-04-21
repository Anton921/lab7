class OrderMailerPreview < ActionMailer::Preview
    def place_an_order
        OrderMailer.with(user: User.first, order: Order.first).place_an_order
    end
end