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

  def boxes
    @current_user = current_user
  end

  def add_boxes
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    @quantity = params[:add_box_number].to_i
    @amount = @quantity * 500

    charge = Stripe::Charge.create(
      amount: @amount,
      currency: "usd",
      customer: current_user.stripe_id
    )

    subscription_id = customer.subscriptions[:data][0][:id]
    subscription = Stripe::Subscription.retrieve(subscription_id)
    subscription.quantity += (@quantity * 5)
    subscription.save
    current_user.purchased_boxes += @quantity
    current_user.save

    redirect_to new_transaction_path
  end

  def delete
  	customer = Stripe::Customer.retrieve(current_user.stripe_id)
  	subscription_id = customer["subscriptions"]["data"][0]["id"]
  	subscription = Stripe::Subscription.retrieve(subscription_id)
  	subscription.delete

    flash[:notice] = "Subscription successfully cancelled, use until expiration date!"
    redirect_to new_transaction_path
  end


end
