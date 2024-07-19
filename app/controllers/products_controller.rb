class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :add_to_cart]

  def index
    @products = if params[:filter] == 'new'
                  Product.newly_added.page(params[:page]).per(10)
                elsif params[:filter] == 'recently_updated'
                  Product.recently_updated.page(params[:page]).per(10)
                else
                  Product.page(params[:page]).per(10)
                end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    save_images(@product)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    save_images(@product)
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  def add_to_cart
    # Use params[:id] to find the product
    product = Product.find(params[:id])

    # Ensure the user has a cart
    cart = current_user.cart || current_user.create_cart

    # Find or create a cart item
    cart_item = cart.cart_items.find_by(product: product)
    if cart_item
      cart_item.increment!(:quantity)
    else
      cart.cart_items.create(product: product, quantity: params[:quantity] || 1)
    end

    redirect_to products_path, notice: 'Product added to cart.'
  end



  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity_available, :leftside_img, :rightside_img, :front_img, :back_img, :category_id)
  end

  def save_images(product)
    if params[:product][:leftside_img].present?
      product.leftside_img = save_image(params[:product][:leftside_img])
    end
    if params[:product][:rightside_img].present?
      product.rightside_img = save_image(params[:product][:rightside_img])
    end
    if params[:product][:front_img].present?
      product.front_img = save_image(params[:product][:front_img])
    end
    if params[:product][:back_img].present?
      product.back_img = save_image(params[:product][:back_img])
    end
  end

  def save_image(uploaded_file)
    filename = SecureRandom.hex + File.extname(uploaded_file.original_filename)
    filepath = Rails.root.join('public', 'images', 'products', filename)
    File.open(filepath, 'wb') do |file|
      file.write(uploaded_file.read)
    end
    "/images/products/#{filename}"
  end
end
