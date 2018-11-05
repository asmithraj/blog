class ConfluencesController < ApplicationController

	def index

		@file_content = IO.read("#{Rails.root}/confluence_json.json")
	end

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



	# --------------------------
	def get_childrens (parent)
		return children
	end

	def create_json
		@space_content = []

		requesturl = 'https://cloudchomp.atlassian.net/wiki/rest/api/content/5177345/child/page?expand=children.page,children.page.children.page'
		@response = RestClient::Request.execute(
			method: :get,
			url: requesturl,
			headers: { Authorization: 'Basic YXNtaXQucmFqYmhhbmRhcmlAY2xvdWRjaG9tcC5jb206cHJvQ0FCOTkrKw==' }
		)
		
		@response = JSON.parse(@response)
		json_array = []
		json_array = parse_value @response['results']
		# abort json_array.inspect
		@json_string = json_array.to_json
		File.open("confluence_json.json", 'w') { |file| file.write(@json_string) }
	end

	def parse_value result
		i = [];
		result.each do |obj|
			level_children = []
			level_children = parse_value obj["children"]["page"]["results"] if (!obj['children'].nil? && !obj['children']['page'].nil?)
			object = { 
					"id": obj["id"], 
					"title": obj["title"],
					"type": obj["type"],
					"children": level_children
				} 
			i.push(object)
		end
		i
	end

end