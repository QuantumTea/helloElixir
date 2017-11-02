defmodule HTCPCP do

	def startServer() do
	end

	def endServer() do
	end

	def processGetRequest() do
		# respond to a GET with a proper 418 error
		startServer()
		url = "https://localhost:8080/htcpcp/"
		response = HTTPotion.request(:get, url)
		endServer()
		response
	end

end