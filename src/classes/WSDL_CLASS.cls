//Generated by wsdl2apex

public class WSDL_CLASS {
    public class DNSInfo {
        public String HostName;
        public WSDL_CLASS.ArrayOfString Aliases;
        public WSDL_CLASS.ArrayOfString AddressList;
        private String[] HostName_type_info = new String[]{'HostName','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] Aliases_type_info = new String[]{'Aliases','http://tempuri.org/','ArrayOfString','0','1','false'};
        private String[] AddressList_type_info = new String[]{'AddressList','http://tempuri.org/','ArrayOfString','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/','true','false'};
        private String[] field_order_type_info = new String[]{'HostName','Aliases','AddressList'};
    }
    public class ArrayOfString {
        public String[] string_x;
        private String[] string_x_type_info = new String[]{'string','http://www.w3.org/2001/XMLSchema','string','0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/','true','false'};
        private String[] field_order_type_info = new String[]{'string_x'};
    }
    public class DNSLookup_element {
        public String server;
        private String[] server_type_info = new String[]{'server','http://www.w3.org/2001/XMLSchema','string','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/','true','false'};
        private String[] field_order_type_info = new String[]{'server'};
    }
    public class DNSLookupResponse_element {
        public WSDL_CLASS.DNSInfo DNSLookupResult;
        private String[] DNSLookupResult_type_info = new String[]{'DNSLookupResult','http://tempuri.org/','DNSInfo','0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://tempuri.org/','true','false'};
        private String[] field_order_type_info = new String[]{'DNSLookupResult'};
    }
    public class DNSSoap {
        public String endpoint_x = 'http://ws.strikeiron.com/relauto/iplookup/DNS';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public CLASS_WSDL.SubscriptionInfo SubscriptionInfo;
        public CLASS_WSDL.LicenseInfo LicenseInfo;
        private String SubscriptionInfo_hns = 'SubscriptionInfo=http://ws.strikeiron.com';
        private String LicenseInfo_hns = 'LicenseInfo=http://ws.strikeiron.com';
        private String[] ns_map_type_info = new String[]{'http://ws.strikeiron.com', 'CLASS_WSDL', 'http://tempuri.org/', 'WSDL_CLASS'};
        public WSDL_CLASS.DNSInfo DNSLookup(String server) {
            WSDL_CLASS.DNSLookup_element request_x = new WSDL_CLASS.DNSLookup_element();
            WSDL_CLASS.DNSLookupResponse_element response_x;
            request_x.server = server;
            Map<String, WSDL_CLASS.DNSLookupResponse_element> response_map_x = new Map<String, WSDL_CLASS.DNSLookupResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://tempuri.org/DNSLookup',
              'http://tempuri.org/',
              'DNSLookup',
              'http://tempuri.org/',
              'DNSLookupResponse',
              'WSDL_CLASS.DNSLookupResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.DNSLookupResult;
        }
        public void GetRemainingHits() {
            CLASS_WSDL.GetRemainingHits_element request_x = new CLASS_WSDL.GetRemainingHits_element();
            CLASS_WSDL.GetRemainingHitsResponse_element response_x;
            Map<String, CLASS_WSDL.GetRemainingHitsResponse_element> response_map_x = new Map<String, CLASS_WSDL.GetRemainingHitsResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://ws.strikeiron.com/relauto/iplookup/DNS/GetRemainingHits',
              'http://ws.strikeiron.com',
              'GetRemainingHits',
              'http://ws.strikeiron.com',
              'GetRemainingHitsResponse',
              'CLASS_WSDL.GetRemainingHitsResponse_element'}
            );
            response_x = response_map_x.get('response_x');
        }
    }
}