class StripePaymentService
  def initialize(order, token)
    @order = order
    @token = token
  end

  def call
    create_charge
  end

  private

  def create_charge
    Stripe::Charge.create({
                            amount:      (@order.total_with_tax * 100).to_i, # Amount in cents
                            currency:    "usd",
                            source:      @token,
                            description: "Order ##{@order.id}"
                          })
  rescue Stripe::CardError => e
    e.message
  end
end
