require 'ecpay_payment'


    ## 參數值為[PLEASE MODIFY]者，請在每次測試時給予獨特值
    ## 若要測試非必帶參數請將base_param內註解的參數依需求取消註解 ##

    base_param = {
      'MerchantID' => '2000132', 
      'MerchantTradeNo' => 'f0a0dasae1bb72bc93', 
      'MerchantTradeDate' => '2017/02/13 15:45:30', 
      'TotalAmount' => '100',
      'TradeDesc' => '測試交易描述',
      'ItemName' => '測試商品等',
      'ReturnURL' => 'http://192.168.0.1'
    }


    ## 若要測試開立電子發票，請將inv_params內的"所有"參數取消註解 ##
    inv_params = {    
      'RelateNumber' => 'SJDFJGH24FJIL97G73653XM0VOMS4K', 
      'CustomerID' => 'MEM_0000001',  
      'CustomerIdentifier' => 'fh23inf',   
      'CustomerName' => '測試買家',
      'CustomerAddr' => '測試用地址',
      'CustomerPhone' => '0123456789',
      'CustomerEmail' => 'johndoe@test.com',
      'ClearanceMark' => '2',
      'TaxType' => '1',
      'Donation' => '2',
      'Print' => '1',
      'InvoiceItemName' => '測試商品1|測試商品2',
      'InvoiceItemCount' => '2|3',
      'InvoiceItemWord' => '個|包',
      'InvoiceItemPrice' => '35|10',
      'InvoiceItemTaxType' => '1|1',
      'InvoiceRemark' => '測試商品1的說明|測試商品2的說明',
      'DelayDay' => '0',
      'InvType' => '07'    
    }

    create = ECpayPayment::ECpayPaymentClient.new
    htm = create.aio_check_out_credit_onetime(params: base_param)

puts htm