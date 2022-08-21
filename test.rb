require 'uri'
h1 = {"MerchantID"=>"TWD987086921", "TimeStamp"=>"1661057390318", "Version"=>"2.0", "RespondType"=>"JSON", "MerchantOrderNo"=>"test03150011661057390318", "Amt"=>"30", "CREDIT"=>"1", "NotifyURL"=>"https://webhook.site/6a182a2c-371f-4267-a433-727d50522e29", "LoginType"=>"0", "InstFlag"=>"0", "ItemDesc"=>"test"}

a1 = h1.to_a

p URI.encode_www_form(a1)


