class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to @comment.product, notice: "comentário enviado"
    else
      @product = @comment.product
      render "products/show"
    end
  end

  private 
  def comment_params
    params.require(:comment).permit(:product_id, :body)
  end
end
