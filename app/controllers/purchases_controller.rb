class PurchasesController < ApplicationController
  before_action :set_seller
  before_action :set_product

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = @product.purchases.all
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save!
        format.html do
          redirect_to(
            seller_product_purchases_path(@seller, @product),
            notice: 'Purchase was successfully created.'
          )
        end
        format.json do
          render(
            { controller: :products, action: :index },
            status: :created, location: @purchase
          )
        end
      else
        flash[:error] = 'Purchase not saved'
        format.html { render :index }
        format.json do
          render json: @purchase.errors, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def set_seller
    @seller = Seller.find(params[:seller_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def purchase_params
    params.require(:purchase).permit(
      Purchase.attribute_names.map(&:to_sym)
    )
  end
end
