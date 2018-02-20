class GivesController < ApplicationController
	def new

  end

  def create
    @email = params[:stripeEmail]
    @admin_email = 'ceze1990@gmail.com'
    @first_name = params[:gives][:first_name]
    @last_name = params[:gives][:last_name]
    @phone_number = params[:gives][:phone_number]
    @address = params[:gives][:address]
    @state = params[:gives][:state]
    @city = params[:gives][:city]
    @zip = params[:gives][:zip]
    @amount = params[:gives][:tithe].to_f + params[:gives][:offering].to_f + params[:gives][:missions].to_f + params[:gives][:other].to_f
    @tithe = params[:gives][:tithe] || 0.0
    @offering = params[:gives][:offering] || 0.0
    @mission = params[:gives][:missions] || 0.0
    @other = params[:gives][:other] || 0.0
    token=params[:stripeToken]
    if (@amount< 0.5)
      @amount = 0.5;
      @other = 0.5;
    end

    begin

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      Stripe::Charge.create(
          amount: (@amount * 100).to_i,
          currency: "usd",
          customer: customer.id,
          description: @email
      )
      email()
    rescue Stripe::CardError => e
      @error = e
      render :new
    end

  end

  def email
    UserMailer.user_email(@email, @amount).deliver_now
    UserMailer.admin_email(@admin_email, @amount, @first_name, @last_name, @tithe, @offering, @mission, @other).deliver_now
  end

  def give_params
    params.require(:give).permit(:first_name,:last_name,:phone_number,:address, :state, :city, :zip, :amount,:tithe,:offering,:mission,:other,:stripeToken)
  end
end

