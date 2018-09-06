json.title @product.title
json.updated @latest_order.try(:updated_at)

json.orders @product.orders.each do |order|
  json.order order.id
  json.shipped_to order.address

  json.line_items order.line_items.each do |item|
    json.product_title item.product.title
    json.product_quantity item.quantity
    json.product_total_price number_to_currency item.total_price
  end
  json.order_total_price number_to_currency order.line_items.map(&:total_price).sum
  json.paid_by order.pay_type
  json.author_info do
    json.author_name order.name
    json.author_email order.email
  end
end