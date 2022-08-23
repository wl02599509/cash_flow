class PaymentsController < ApplicationController
  require 'uri'
  require 'openssl'

  @key = "TTF0Fg1QxAOejgV1FZxXgWKQlO52njrO"
  @iv = "Cwah1NwceYk3PmKP"

  def fulfill
  end

  def info
    @url_encoded_query_string = params.keys[0].delete('{').delete('}').gsub!(/:/, '=').gsub!(/"/, '').gsub!('=//','%3A%2F%2F').gsub!('/','%2F').split(',').join('&')
    
    trade_info = aes_encode(@url_encoded_query_string)

    sha = sha256_encode(@key, @iv, trade_info)

    result = {
      MerchantID: 'TWD987086921',
      TradeInfo: trade_info,
      TradeSha: sha,
      Version: '2.0'
    }
    
    render json: result
  end

  
  private
  #加密 step 1
  def trade_info
    aes_encode(@url_encoded_query_string)
  end
  
  def aes_encode(string)
    cipher = OpenSSL::Cipher::AES256.new(:CBC)
    cipher.encrypt
    cipher.key = "l2Nvw3YlqoEk6G4HqRKDAYpHKZWxN4LM"
    cipher.iv = "gXYC1Fpliev4dtLw"
    cipher.padding = 0
    padding_data = add_padding(string)
    encrypted = cipher.update(padding_data) + cipher.final
    encrypted.unpack('H*').first
  end
  
  def add_padding(data, block_size = 32)
    pad = block_size - (data.length % block_size)
    data + (pad.chr * pad)
  end

  # 加密 step 2
  def trade_sha
    sha256_encode(@key, @iv, encode_query)
  end
  
  def sha256_encode(key, iv, info)
    encode_string = "HashIV=#{iv}&#{info}&HashKey=#{key}"
    Digest::SHA256.hexdigest(encode_string).upcase
  end
end
