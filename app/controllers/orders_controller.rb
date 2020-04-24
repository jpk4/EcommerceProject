# frozen_string_literal: true

class OrdersController < ApplicationController
  def index; end

  def new
    if session[:cart].empty?
      @cart = []
    else
      keys = session[:cart].keys
      @cart = Product.find(keys)
    end
    @province = Province.find_by(code: 'MB')
  end

  def tax
    @province = Province.find(params[:province_id])
    if session[:cart].empty?
      @cart = []
    else
      keys = session[:cart].keys
      @cart = Product.find(keys)
    end
  end

  def create_order
    @province = Province.find(params[:prov_id])
    @customer = Customer.new(name: params[:name], shipping_address: "#{params[:delivery_address]}, #{params[:city]}", province: @province.id)
    @payment = Payment.new(card_number: '4242424242424242', card_type: 'Visa', billing_address: "#{params[:delivery_address]}, #{params[:city]}", expiry_month: 12, expiry_year: 2022, cvv_code: 123)
    @order = Order.new(order_date: DateTime.now, customer: @customer, payment: @payment, order_gst: @province.gst, order_pst: @province.pst, order_hst: @province.hst)

    keys = session[:cart].keys

    keys.each do |key|
      @product = Product.find(key)
      OrderProduct.create(order: @order, product: @product, qty_ordered: session[:cart][key].to_i, sales_price: @product.current_price)
    end

    if @customer.save && @payment.save && @order.save
      redirect_to '/orders'
      session.delete(:cart)
    else
      redirect_to '/'
    end
  end
end
