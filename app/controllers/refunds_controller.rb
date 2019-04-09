class RefundsController < ApplicationController
  before_action :set_seller
  before_action :set_product
  before_action :set_purchase

  # POST /refunds
  # POST /refunds.json
  def create
    @refund = Refund.new(refund_params)

    respond_to do |format|
      if @refund.save
        format.html do
          redirect_to(
            seller_product_purchases_path(@seller, @product),
            notice: 'Refund was successfully created.'
          )
        end
        format.json { render :show, status: :created, location: @refund }
      else
        format.html { render :new }
        format.json { render json: @refund.errors, status: :unprocessable_entity }
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

  def set_purchase
    @purchase = Purchase.find(params[:purchase_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def refund_params
    params.require(:refund).permit(
      Refund.attribute_names.map(&:to_sym)
    )
  end
end
