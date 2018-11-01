class ConfluencesController < ApplicationController

	def getspacelist
		@response = RestClient::Request.execute(
			method: :get,
			url: 'https://cloudchomp.atlassian.net/wiki/rest/api/space/',
			headers: { Authorization: 'Basic YXNtaXQucmFqYmhhbmRhcmlAY2xvdWRjaG9tcC5jb206cHJvQ0FCOTkrKw==' }
		)
		@api_response = JSON.parse(@response)
		@space_list = Hash.new
		@api_response["results"].each do |response|
			id = response["_expandable"]["homepage"]
			id = id.split("/")
			id = id.last
			space_name = response["name"]
			@space_list[id] = space_name
		end
		return @space_list
	end

	def getspacepages
		requesturl = 'https://cloudchomp.atlassian.net/wiki/rest/api/content/'
		requesturl = requesturl+params[:space_id]+'/child/page'
		@response = RestClient::Request.execute(
			method: :get,
			url: requesturl,
			headers: { Authorization: 'Basic YXNtaXQucmFqYmhhbmRhcmlAY2xvdWRjaG9tcC5jb206cHJvQ0FCOTkrKw==' }
		)
		@response = JSON.parse(@response)
	end

	def getchildpages
		requesturl = 'https://cloudchomp.atlassian.net/wiki/rest/api/content/'
		requesturl = requesturl+params[:page_id]+'/child/page'
		@response =  RestClient::Request.execute(
			method: :get,
			url: requesturl,
			headers: { Authorization: 'Basic YXNtaXQucmFqYmhhbmRhcmlAY2xvdWRjaG9tcC5jb206cHJvQ0FCOTkrKw==' }
		)
		@response = JSON.parse(@response)
		# if the page has no child, go to content view page
		if @response["results"].empty?
			@value = 'nill'
			#redirect_to controller: getviewcontent, content_id: params[:space_id]
		end
	end

	def getviewcontent
		requesturl = 'https://cloudchomp.atlassian.net/wiki/rest/api/content/'
		requesturl = requesturl+params[:content_id]+'?expand=body.styled_view'
		@response =  RestClient::Request.execute(
			method: :get,
			url: requesturl,
			headers: { Authorization: 'Basic YXNtaXQucmFqYmhhbmRhcmlAY2xvdWRjaG9tcC5jb206cHJvQ0FCOTkrKw==' }
		)
	end

	def create_json
	
		requesturl = 'https://cloudchomp.atlassian.net/wiki/rest/api/content/5177345/child/page?expand=children.page,children.page.children.page'
		@response = RestClient::Request.execute(
			method: :get,
			url: requesturl,
			headers: { Authorization: 'Basic YXNtaXQucmFqYmhhbmRhcmlAY2xvdWRjaG9tcC5jb206cHJvQ0FCOTkrKw==' }
		)
	end

end
