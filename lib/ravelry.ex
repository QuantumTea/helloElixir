defmodule Ravelry do

	def getAuthDataFromFile do
		username = File.read!("./res/username.ravelry") 
		accessKey = File.read!("./res/accesskey.ravelry") 
		personalKey = File.read!("./res/personalkey.ravelry") 
		%{:username => username, :accessKey => accessKey, :personalKey => personalKey}
	end

	def getAuthTuple do
		# assemble basic auth header with username = access key and password = personal key
		auth = getAuthDataFromFile
		%{
			"user:" => auth.accessKey, 
			"password:" => auth.personalKey
		}
	end

	def buildRequest(endpoint) do
		user = getAuthDataFromFile.username
		# HTTPoison.post(buildRequest(endpoint), body, headers, [hackney: [basic_auth: {getAuthDataFromFile.accessKey, getAuthDataFromFile.personalKey}]])
		"/people/" <> user <> endpoint
	end

	def getRavelryJsonData(endpoint) do
		# options = "{ Basic " <> getAuthDataFromFile.accessKey <> "," <> getAuthDataFromFile.personalKey <> "}"
		IO.puts getAuthTuple
		options = %{
			"body" => "",
		 	"basic_auth:" => getAuthTuple
		}
		IO.puts options
		HTTPotion.get(buildRequest(endpoint), options)
	end

end