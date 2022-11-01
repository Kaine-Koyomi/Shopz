class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action  :authenticate_seller!, only: %i[edit new create]
  include SuggestedProducts
  before_action :set_suggested_products, only: %i[show]


  # GET /products or /products.json
  def index
    @orders = Order.all
    if params[:search].blank?
      @products = Product.page params[:page]
    else
      @products = Product.search(params[:search]).page params[:page]
    end
  end

  # GET /products/1 or /products/1.json
  def show
    @comment = Comment.new
    @order = Order.new
    @orders = Order.all
  end

  def add_to_cart
    id = params[:id]
    Order.where(:product_id => id, :user_id => current_user.id).destroy
    
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to orders_path( product_id: id, quantity: 1)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = current_seller.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :photo)
    end

    def initialize_session
      session[:cart] ||= []
    end
    
    def set_list
      @list = Product.all
    end

end
