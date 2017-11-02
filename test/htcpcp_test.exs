defmodule HTCPCPTest do
  use ExUnit.Case
  doctest HTCPCP

  test "Get a 418 response back from the HTCPCP server" do
  	response = HTCPCP.processGetRequest()  	 
  	
  	assert response != nil
    assert HTTPotion.Response.success?(response)
    assert response.status_code == 418
  end

end