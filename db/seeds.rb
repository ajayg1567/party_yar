 supercats =["Birthday","Birthday Balloon Decoration","Anniversary","Baby Shower n Naming Ceremony","Corporate Gifting"]
 supercats.each do |sc|
   SuperCategory.create(name: sc)
 end
 occasion = Occasion.create(name: "All Occasion")
 cats1 = ["Birthday Decorations","Helium Balloons Home Delivery","Helium Balloons Combo","Character Foil Helium Balloons","Helium Balloons Surprises"]
 cats1.each do |sc|
   Category.create(name: sc, super_category_id: SuperCategory.first.id,occasion_id: occasion.id)
 end
 sub_categories1 = ["Best Seller House Decorations","Best Seller Office Decorations","Best Seller Party Hall Decorations","Best Seller Helium Balloons","Party Hall Decorations","Outdoor or Club House Decoration","Office Decoration"]
 sub_categories1.each do |sub_category|
    SubCategory.create(name: sub_category,category_id: Category.first.id )
 end
 sub_categories2 = ["Best Seller Helium Balloons","Red n White Heart Shape Balloons","Smiley Helium Balloons","Metallic Helium Balloons","Printed Helium Balloons","LED Helium Balloons","Chrome Helium Balloons","Transparent Helium Balloons","Macron Helium Balloons"]
 sub_categories2.each do |sub_category|
    SubCategory.create(name: sub_category,category_id: Category.second.id )
 end
 sub_categories3 = ["Best Seller Helium Balloons Combo","Balloons+Flower Bouquet","Helium n Air Balloon Combo","Box Balloons+Cake+Flower Bouquet","Helium Balloons n Foil Balloons"]
 sub_categories3.each do |sub_category|
    SubCategory.create(name: sub_category,category_id: Category.third.id )
 end
 sub_categories4 = ["Baby Shower Foil","Smiley Foil","Animals Foil","Cartoon Character Foil","Super Human Foils","Space Foils","Heart Shape Foil","Star Shape Foil"]
 sub_categories4.each do |sub_category|
    SubCategory.create(name: sub_category,category_id: Category.fourth.id )
 end
 

 cats1 = ["House Decoration","Surprise Room Decorations","Club House Or Party Hall Decorations","Lawn n Out Door Decoration"]
 cats1.each do |sc|
   Category.create(name: sc, super_category_id: SuperCategory.second.id,occasion_id: occasion.id)
 end

  sub_categories1 = ["Best Seller House Decoration","Balloon Decor with HBD Notion","Balloon with Simple Backdrop Decor","Balloon Pillars with Foil","Balloon Decor with Cake Table Decor","Semi Arch Decors"]
  categoryid = Category.find_by_name("House Decoration").id
  sub_categories1.each do |sub_category|
    SubCategory.create(name: sub_category,category_id: categoryid )
 end

 sub_categories2 = ["Bestseller Room Decor","Room Decor with Rose Petals","Room Decor with Surprise Gifts","Hotel Room Decor Surprise","Room Decor for KIDS"]
 categoryid = Category.find_by_name("Surprise Room Decorations").id
 sub_categories2.each do |sub_category|
    SubCategory.create(name: sub_category,category_id: categoryid )
 end

 sub_categories3 = ["Arch n Bunch For Party Hall Decor","Screens n Arches n Pillars n Bunch decor","Mini Birthday Theme Decor","Mega Birthday Theme Decor","Decor with Value Additionals"]
 categoryid =   Category.find_by_name("Club House Or Party Hall Decorations").id
 sub_categories3.each do |sub_category|
    SubCategory.create(name: sub_category,category_id: categoryid )
 end

 sub_categories4 = ["Flex n Arch Combos at Lawn","Screen n Arch Combos at Lawn","Pool Side Decorations","OutDoor Lighting with Decors"]
 categoryid =   Category.find_by_name("Lawn n Out Door Decoration").id 
 sub_categories4.each do |sub_category|
    SubCategory.create(name: sub_category,category_id: categoryid )
 end
 






  
 
 
 
 
 
 
 
 























 
 
  
  
  
  
  
  
  
  