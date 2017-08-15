defmodule Ravelry do

	def getAuthDataFromFile do
		username = File.read!("./res/username.ravelry") 
		accessKey = File.read!("./res/accesskey.ravelry") 
		personalKey = File.read!("./res/personalkey.ravelry") 
		%{:username => username, :accessKey => accessKey, :personalKey => personalKey}
	end

	def buildRequest(endpoint) do
		user = getAuthDataFromFile.username
		"https://api.ravelry.com/people/" <> user <> endpoint
	end

	def getRavelryJsonData(endpoint) do
		auth = getAuthDataFromFile
		url = buildRequest(endpoint)
		IO.inspect url
		options = [hackney: [basic_auth: {auth.accessKey, auth.personalKey}]]
		HTTPotion.get url, options
	end

end