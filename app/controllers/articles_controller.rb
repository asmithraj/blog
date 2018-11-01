class ArticlesController < ApplicationController
	
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
		@category = Category.all
	end

	def edit
		@article = Article.find(params[:id])
		@category = Category.all
	end

	def create
		@article = Article.new(article_params)
		@category = Category.all
	 	if @article.save
	 		redirect_to @article
	 	else
	 		render 'new'
	 		# redirect_to action: "new" 
	 	end
	end

	def update 
		@article = Article.find(params[:id])
		# @category = Category.all
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
	    @article = Article.find(params[:id])
	    authorize @article
	    @article.destroy
	    redirect_to articles_path
  	end

  	def showcategoryarticles
  		@category = Category.find(params[:category_id])
 	end

	private
  		def article_params
    		params.require(:article).permit(:title, :text, :category_id)
  		end
end
