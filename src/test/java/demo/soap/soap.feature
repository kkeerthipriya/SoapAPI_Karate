@ignore
Feature:
    sample karate test script that includes SOAP calls
    to the following demo service:
    http://www.webservicex.com/stockquote.asmx?op=GetQuote

Background:
* url 'https://wfxtest.forevernew.com.au/Services/Forevernew.svc/soap'

Scenario: soap 1.1
Given request
"""
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="http://schemas.datacontract.org/2004/07/WFXPLMServices" xmlns:ns2="http://schemas.microsoft.com/2003/10/Serialization/Arrays" xmlns:ns3="http://tempuri.org/">
   <SOAP-ENV:Body>
      <ns3:GetPOShipmentBySKU>
         <ns3:SKUData>
            <ns1:AuthenticationToken>04463633-0EA4-4A3F-8248-B698A42D76D8</ns1:AuthenticationToken>
            <ns1:Barcodes>
               <ns2:string>2023545502004</ns2:string>
               <ns2:string>2023593101044</ns2:string>
               <ns2:string>2023593101082</ns2:string>
            </ns1:Barcodes>
         </ns3:SKUData>
      </ns3:GetPOShipmentBySKU>
   </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""
When soap action 'http://tempuri.org/IForevernew/GetPOShipmentBySKU'
Then status 200
And match response[*].Records.Record[0] == {"BarcodeNumber": "2023545502004", "PurchaseOrders": {"PurchaseOrder": [{"PONumber": '#PO_Number',"Quantity": "100","ETADCDate": "26 Nov 2017"}]}},{"BarcodeNumber": "2023593101044"},{"BarcodeNumber": "2023593101082"}

* def last = //GetPOShipmentBySKU
* print last
* print response.PO_Number