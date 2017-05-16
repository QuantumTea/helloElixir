defmodule Ravelry do

	def getAuthDataFromFile do
		username = File.read!("./res/username.ravelry") 
		accessKey = File.read!("./res/accesskey.ravelry") 
		personalKey = File.read!("./res/personalkey.ravelry") 
		%{:username => username, :accessKey => accessKey, :personalKey => personalKey}
	end

end