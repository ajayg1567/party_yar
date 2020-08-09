class ImportProductJob < ApplicationJob
  include SuckerPunch::Job

  def perform(sheet, super_category_id, shipping_method_id,sub_category_id)
    header_parameterize = []
    header = sheet.row(1)
    header_count = header.count
    header.each do |h|
      header_parameterize << h.parameterize.underscore
    end
    begin
    (2..sheet.last_row).each do |i|
      # spreadsheet = sheet.row(i).first.split(/[\|]/,header_count)
      row = Hash[[header_parameterize, sheet.row(i)].transpose]
      product = Product.new
      product_upgrades = {}
      if ((row.to_hash.include?'product_upgrade_quantity') && (row.to_hash.include?'product_upgrade_price'))
        product.attributes = row.to_hash.except('product_upgrade_quantity','product_upgrade_price')
        product_upgrades["product_upgrade_quantity"] = row.to_hash["product_upgrade_quantity"]
        product_upgrades["product_upgrade_price"] = row.to_hash["product_upgrade_price"]
      end
      product.attributes = product.attributes.merge!("sub_category_id" => sub_category_id,"super_category_id"=> super_category_id, "shipping_method_id"=> shipping_method_id)
      product.save!
      pu = ProductUpgrade.new
      pu.quantity = product_upgrades["product_upgrade_quantity"]
      pu.price = product_upgrades["product_upgrade_price"]
      pu.product_id = product.id
      pu.save!
    rescue Exception => e
      return false
    end
  end
    return true
  end

end
