class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update, :destroy]

    def new
        @comment = Comment.new(user: current_user, product_id: params[:product_id])
    end

    def show
    end

    def create
        @comment = Comment.new(user: current_user, product_id: params[:product_id])
        @comment.update(comment_params)
        if @comment.save
            flash[:success] = 'Comment created!'
            redirect_to @comment.product
        else
            @comments = Comment.order created_at: :desc
            redirect_to root_path
        end 
    end

    def edit
    end

    def update
        @comment.update(comment_params)
        redirect_to @comment.product
    end

    def destroy
        @comment.destroy
        redirect_to @comment.product
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :rating)
    end

    def set_categories
        @categories = Category.all
    end
    
    def set_product
        @product = Product.find(params[:product_id])
    end

    def set_comment
        @comment = Comment.find(params[:id])
    end
end