<?PHP
    class ADDRESSBOOKMessage{

        protected $configs;

        protected $Address='';

        protected $Target='';

        function __construct($configs){
            $this->configs=$configs;
        }
        
        public function setAddress($address){
            $this->Address=$address;
        }
        
        public function setAddressbook($target){
            $this->Target=$target;
        }

        protected function buildRequest(){
            $request=array();
            $request['address']=$this->Address;
            if($this->Target!=''){
                $request['target']=$this->Target;
            }
            return $request;
            
        }
        public function subscribe(){
            $addressbook=new message($this->configs);
            return $addressbook->subscribe($this->buildRequest());
        }
        public function unsubscribe(){
            $addressbook=new message($this->configs);
            return $addressbook->unsubscribe($this->buildRequest());
        }
        
    }