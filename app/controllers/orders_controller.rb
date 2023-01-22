class OrdersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :set_customer, only: %i[update create]
    before_action :set_order, only: %i[show edit update destroy]
    layout 'customer_layout'

    def index
        @orders=Order.all
    end

    def show
        
    end

    def new
        @order=Order.new
    end

    def edit
    end


    def update
       # set_customer
        if @order.update(order_params)
            flash.notice= "The order record was successfully updated "
            redirect_to @order
        else
            flash.now.alert = @customer.errors.full_messages.to_sentence
            render :edit
        end

    end

    def create
        #set_customer
        @order = @customer.orders.create(order_params)
        if @order.save
            flash.notice= "The order record was successfully created"
            redirect_to @order
        else
            flash.now.alert= @order.errors.full_messages.to_sentence
            render :new
        end  
       
    end

    def destroy
        @order.destroy
        redirect_to customer_path(@order.customer_id)
    end

    private
    
    def set_order
        @order=Order.find(params[:id])
    end

    def set_customer
        @customer = Customer.find(params[:order][:customer_id])
    end

    def order_params
        params.require(:order).permit(:product_name,:product_count,:customer_id)
    end

    def catch_not_found(e)
        Rails.logger.debug("We had a not found exception.")
        flash.alert = e.to_s
        redirect_to orders_path
      end
  
end
