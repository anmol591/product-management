class ProductsController < ApplicationController
	def new
		@product=Product.new
		@categories=Category.all
		
	end
	def create
		@product=Product.new(product_params)
		if @product.save
			flash[:notice]="Product added successfully"
			redirect_to :action=>'index'
		else
			flash.now[:error] = "Product did not add successfully"
			render :action=>'new'
		end

	end
	def show
		@product=Product.find(params[:id])
		
	end
	def edit
		@categories=Category.all
		@product=Product.find(params[:id])
		
	end
	def index
		@products=Product.all
		@categories=Category.all
		
	end
	def update
		
		@product=Product.find(params[:id])
		if (@product.update_attributes(product_params))
			flash[:notice]="Product updated successfully"
			redirect_to :action=>'show', :id=>@product
			
		else
			@categories=Category.all
			flash.now[:error] = "Edit the product details correctly"
			render :action=>'edit', :id=>@product
		end

		
	end
    def destroy
		@product=Product.find(params[:id])
		@product.destroy
	   respond_to do |format|
      	   format.html{redirect_to root_path}
      	   format.js
	  	end
   end
	def product_params
		params.require(:product).permit(:name, :price, :category_id)
		
	end
end
	