class ProductsController < ApplicationController
  before_action :set_seller
  before_action :set_product, only: %i[show edit update destroy purchase]

  # GET /products
  # GET /products.json
  def index
    @products = @seller.products.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = @seller.products.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = @seller.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to [@seller, @product], notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: [@seller, @product] }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to [@seller, @product], notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def purchase
    @purchase = @product.purchases.build(product_purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_seller
    @seller = Seller.find(params[:seller_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(
      Product.attribute_names.map(&:to_sym)
    )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_purchase_params
    params.require(product: :purchase).permit(
      :product_id, :product_price
    )
  end
end
