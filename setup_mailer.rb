=begin

Mailer Code

1. mail configuration
   in config/initializers/setup_mailer.rb
   
   see email for config details

1a. restart server

2. rails generate mailer Notification order_confirmation (order_confirmation is the method here)

3. callback in order.rb

       after_create :send_confirmation


    def send_confirmation
        Notification.order_confirmation(self).deliver!
    end

4. in app/mailers/notification.rb
 
   def order_confirmation(order)
    @order = order

    mail to: "#{order.user.email}", subject: "Your order has been confirmed - #{order.order_number}"
  end

5. in app/views/notification/order_confirmation.html.erb

<p>Hello <%= @order.user.email %></p>

<h2>Your order has been place</h2>
<p>  # : <%= @order.order_number %></p>
<p>  Date : <%= @order.order_date %> </p>
<p>  Total : <%= @order.total_amount %> </p>

<h2>Your line items</h2>
<table border="1">
    <thead>
        <tr>
            <th> # </th>
            <th> Product </th>
            <th> Price </th>
            <th> Quantity </th>
            <th> Total </th>
        </tr>
    </thead>

    <tbody>
        <% @order.order_products.each_with_index do |order_product, index| %>
            <tr>   
                <td><%= index + 1 %></td>
                <td><%= order_product.product.name %></td>
                <td><%= order_product.price %></td>
                <td><%= order_product.quantity %> </td>
                <% total = order_product.price * order_product.quantity %>
                <td><%= total %></td>
            </tr>
        <% end %>
    </tbody>
</table>


=end
