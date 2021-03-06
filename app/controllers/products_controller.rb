class ProductsController < ApplicationController
  before_action :check_current_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :select_product, only: [:show, :edit, :update, :destroy]


  def index
    @products = Product.page(params[:page]).per(2)
    respond_to do |format|
      format.html {}
      format.js {
        @products = Product.where("nama like ? or price like ?", "%#{params[:search]}%", "%#{params[:search]}%")
          .order("#{params[:column]} #{params[:direction]}")
          .page(params[:page]).per(2)
      }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)
    if @product.save
      redirect_to products_url
    else
      render "new"
    end
  end

  def show
    @article = Article.new
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def edit
  end

  def update
    if @product.update(params_product)
      redirect_to products_url
    else
      render "edit"
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private
    def params_product
      params.require(:product).permit(:nama, :quantity, :price, :photo)
    end
    
    def select_product
      @product = Product.find(params[:id])
    end

end
