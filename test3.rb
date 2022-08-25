require 'uri'
require 'openssl'

@key = "5294y06JbISpM5x9"
@vi = "v77hoKGq4kWxNNIS"

a = "ChoosePayment=ALL&EncryptType=1&ItemName=Apple iphone 7 手機殼
&MerchantID=2000132&MerchantTradeDate=2013/03/12
15:30:23&MerchantTradeNo=ecpay20130312153023&PaymentType=aio&ReturnURL=https://www.ecpay.co
m.tw/receive.php&TotalAmount=1000&TradeDesc=促銷方案"


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

p aes_encode(a)