require 'uri'
require 'openssl'
h1 = {"MerchantID"=>"TWD987086921", "TimeStamp"=>"1661057390318", "Version"=>"2.0", "RespondType"=>"JSON", "MerchantOrderNo"=>"test03150011661057390318", "Amt"=>"30", "CREDIT"=>"1", "NotifyURL"=>"https://webhook.site/6a182a2c-371f-4267-a433-727d50522e29", "LoginType"=>"0", "InstFlag"=>"0", "ItemDesc"=>"test"}

h2 = "MerchantID=TWD987086921&TimeStamp=1661057390318&Version=2.0&RespondType=JSON&MerchantOrderNo=test03150011661057390318&Amt=30&CREDIT=1&NotifyURL=https%3A%2F%2Fwebhook.site%2F6a182a2c-371f-4267-a433-727d50522e29&LoginType=0&InstFlag=0&ItemDesc=test"

@key = "l2Nvw3YlqoEk6G4HqRKDAYpHKZWxN4LM"
@iv = "gXYC1Fpliev4dtLw"

p a1 = h1.to_a




def url_encoded_query_string
  URI.encode_www_form(info)
end

def trade_info
  aes_encode(@url_encoded_query_string)
end

def aes_encode(string)
  cipher = OpenSSL::Cipher::AES256.new(:CBC)
  cipher.encrypt
  cipher.key = @key
  cipher.iv = @iv
  cipher.padding = 0
  padding_data = add_padding(string)
  encrypted = cipher.update(padding_data) + cipher.final
  encrypted.unpack('H*').first
end

def add_padding(data, block_size = 32)
  pad = block_size - (data.length % block_size)
  data + (pad.chr * pad)
end

def info
  # a2 = URI.encode_www_form(a1)
  # p aes_encode(a2)
  aes_encode("MerchantID=TWD987086921&TimeStamp=1661057390318&Version=2.0&RespondType=JSON&MerchantOrderNo=test03150011661057390318&Amt=30&CREDIT=1&NotifyURL=https%3A%2F%2Fwebhook.site%2F6a182a2c-371f-4267-a433-727d50522e29&LoginType=0&InstFlag=0&ItemDesc=test")
end

p info