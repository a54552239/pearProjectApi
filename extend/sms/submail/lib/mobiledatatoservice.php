<?PHP
    class mobiledatatoservice{
        
        protected $configs;

        protected $To=array();
        
        protected $Addressbook=array();
        
        
        function __construct($configs){
            $this->configs=$configs;
        }
        
        public function AddTo($address){
            array_push($this->To,trim($address));
        }
        
        public function AddAddressbook($addressbook){
            array_push($this->Addressbook,$addressbook);
        }
        
        public function buildRequest(){
            $request=array();
            if(!empty($this->To)){
                $request['to']='';
                foreach($this->To as $tmp){
                    $request['to'].=$tmp.',';
                }
                $request['to'] = substr($request['to'],0,count($request['to'])-2);
            }
            if(!empty($this->Addressbook)){
                $request['addressbook']='';
                foreach($this->Addressbook as $tmp){
                    $request['addressbook'].=$tmp.',';
                }
                $request['addressbook'] = substr($request['addressbook'],0,count($request['addressbook'])-2);
            }
            return $request;
        }
        public function TOService(){
            $mobiledata=new mobiledata($this->configs);
            return $mobiledata->TOService($this->buildRequest());
        }
        
    }