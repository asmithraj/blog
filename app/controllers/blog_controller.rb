class BlogController < ApplicationController
	def new
	end

	def create
		@blog = Bl.new(param_permission)

		@blog.save
		redirect_to @blog
	end
	private 
		def param_permission
			params.require(:blog).permit(:title, :text)
		end
end
