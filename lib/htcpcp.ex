defmodule HTCPCP do

	def hello do
		:world
	end

	def init(default_options) do
		IO.puts "Initialising plug"
	end

  	def call(conn, options) do
    	IO.puts "Calling plug"
    	conn |> Plug.Conn.send_resp(418, "I'm a teapot")
  	end

	def processGetRequest() do
		# respond to a GET with a proper 418 error
		url = "https://localhost:4000/"
		response = HTTPotion.request(:get, url)
		response
	end

end