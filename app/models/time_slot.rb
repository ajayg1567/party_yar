class TimeSlot < ApplicationRecord
	belongs_to :shipping_method
	#after_create :update_fromto_ampm


  

end
