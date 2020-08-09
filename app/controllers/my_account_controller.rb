class MyAccountController < ApplicationController
	layout 'frontend/application'

	before_action :set_profile
	
	def index
	end

	def new
		@address = Address.new
	end
	
	def create_new
		params_new = Rack::Utils.parse_nested_query(params[:address])
		params_new.delete("utf8")
		params_new.delete("authenticity_token")
		
		@address = Address.new(params_new)
		@address.user_id = 3
		
		if @address.save
			item_id = @address.item_id
			@item = Item.find(item_id)
			@item.additional[:address_id] = @address.id
			@item.save
			render :json => @address.to_json
		else
			render :json=> {:errors=>@address.errors.full_messages},:status=> 422
		end
	end

	def edit_profile

	end

	def update_profile
	  @user = User.find(params[:id])
	  if @user.address.present?
		@user.address.update_attributes(params[:user][:address].permit!)
	  else
		@user.create_address(params[:user][:address].permit!)
	  end
	  if @user.update_attributes(params[:user].except(:address).permit!)
		redirect_to my_account_path
	  else
		render :edit_profile
	  end
	end

	def change_password
		
	end

	private

	def set_profile
		@profile = current_user
	end

	def address_params
		params_new.require(:address).permit(:address_line1,:city,:pincode,:mobile,:landmark,:email,:email,:type,:item_id)
		
	end
end