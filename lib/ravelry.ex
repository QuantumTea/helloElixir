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

	def buildRequestObject do
		auth = getAuthDataFromFile
		# build a JSON object and return it
		# the object is used with the GET request
	end

end