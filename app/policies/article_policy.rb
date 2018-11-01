class ArticlePolicy < ApplicationPolicy

  	def destroy?
    	user.role == "admin" 
  	end

end

	

