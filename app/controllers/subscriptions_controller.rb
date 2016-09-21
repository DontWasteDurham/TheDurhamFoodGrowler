class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    plans = Stripe::Plan.all
    @plans = plans[:data]
    @amount = 100
  end

  def update
    plan_id = params[:plan_id]
    @quantity = params[:quantity]
    token = params[:stripeToken]
    customer = Stripe::Customer.create(
        card: token,
        plan: plan_id,
        email: current_user.email
        )
        
    current_user.stripe_id = customer.id
    current_user.purchased_boxes = @quantity
    current_user.save

    redirect_to welcome_path
  end
end
