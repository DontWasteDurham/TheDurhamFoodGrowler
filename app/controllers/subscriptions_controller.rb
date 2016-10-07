class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    plans = Stripe::Plan.all
    @plans = plans[:data]
    @amount = plans[:data]
  end

  def update
    plan_id = params[:plan_id]
    @quantity = 20 + (params[:box_number].to_i * 5)
    token = params[:stripeToken]
    customer = Stripe::Customer.create(
        card: token,
        plan: plan_id,
        email: current_user.email,
        quantity: @quantity
        )

    current_user.stripe_id = customer.id
    current_user.purchased_boxes = params[:box_number].to_i
    current_user.exp_date = Date.today + 1.year
    current_user.save

    redirect_to new_transaction_path
  end
end
