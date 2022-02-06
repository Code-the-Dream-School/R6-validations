class OrdersController < ApplicationController
   before_action :set_post,only: [:show, :edit, :update, :destroy]
        def index
          @order = Order.all
        end
      
        # GET /order/1 or /customers/1.json
        def show
        end
      
        # GET /order/new
        def new
          @order= Order.new
        end
      
        # GET /order/1/edit
        def edit
        end
      
        # POST /order
        def create
          @order = Order.new(order_params)
          if @order.save
            flash.notice = "The order record was created successfully."
            reload @order
            redirect_to @order
          else
            flash.now.alert = @order.errors.full_messages.to_sentence
            render :new  
          end
        end
      
        # PATCH/PUT /order
        def update
          if @order.update(order_params)
            flash.notice = "The order was updated successfully."
            redirect_to @order
          else
            flash.now.alert = @order.errors.full_messages.to_sentence
            render :edit
          end
        end
        # DELETE /order
        def destroy
          @order.destroy
          redirect_to @order
        end
      
        private
        def order_params
          params.require(:order).permit(:product_name, :product_count,:customer_id)
        end
      
        def set_post
        @order = Order.find(params[:id])
        end
        
          def catch_not_found(e)
            Rails.logger.debug("We had a not found exception.")
            flash.alert = e.to_s
            redirect_to orders_path
      end
      
 end
 