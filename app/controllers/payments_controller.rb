class PaymentsController < ApplicationController
  def fulfill
    # render html:params
  end

  def ttt
    {"{\"MerchantID\":\"mid\",\"TimeStamp\":1661006223175,\"Version\":2,\"RespondType\":\"JSON\",\"MerchantOrderNo\":\"test03150011661006223175\",\"Amt\":30,\"CREDIT\":1,\"NotifyURL\":\"https://webhook.site/6a182a2c-371f-4267-a433-727d50522e29\",\"LoginType\":0,\"InstFlag\":0,\"ItemDesc\":\"test\"}"=>nil}
  end

  def url_encoded_query_string
    URI.encode_www_form(info)
  end

  def trade_info
    aes_encode(url_encoded_query_string)
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

end
