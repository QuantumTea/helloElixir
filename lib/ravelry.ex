defmodule Ravelry do

	def getAuthDataFromFile do
		username = File.read!("./res/username.ravelry") 
		accessKey = File.read!("./res/accesskey.ravelry") 
		personalKey = File.read!("./res/personalkey.ravelry") 
		%{:username => username, :accessKey => accessKey, :personalKey => personalKey}
	end

	def getAuthTuple do
		auth = getAuthDataFromFile
		%{:username => auth.accessKey, :password => auth.personalKey}
	end

	def buildRequest(endpoint) do
		user = getAuthDataFromFile.username
		# GET /people/{username}endpoint
		"/people/" <> user <> endpoint
	end

end