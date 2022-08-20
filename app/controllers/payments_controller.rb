class PaymentsController < ApplicationController
  def fulfill
    # render html:params
  end

  def encode_trade_info
    render json: params.keys[0].delete('{').delete('}').gsub!(/:/, '=').gsub!(/"/, '').gsub!('=//','%3A%2F%2F').gsub!('/','%2F').split(',').join('&')
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
