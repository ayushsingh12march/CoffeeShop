class OrdersController < ApplicationController
  def index
    @page = params.fetch(:page, 0).to_i || 0
    @orders = Order.all.order(created_at: :desc).offset(@page).limit(15)
  end

  def createorder
    if session[:cart]
      order = Order.new({ :user_id => current_user.id, :total => 0, :status => "Pending" })
      tot = 0
      if order.save
        session[:cart].each do |order_item|
          parameter = { :order_id => order.id, :menu_item_id => order_item["dish_id"], :quantity => order_item["quantity"], :total => get_total(order_item) }
          tot = tot + get_total(order_item)
          OrderItem.create!(parameter)
        end
      end
      session[:cart] = nil
      order.total = tot
      order.save
    end
    redirect_to dishes_path
  end

  private

  def get_total(order)
    puts order
    order["dish_price"] * order["quantity"]
  end
end
