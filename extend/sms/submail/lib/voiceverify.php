<?PHP
    class voiceverify{
        
        protected $configs;

        protected $To='';
        
        protected $Code='';

        function __construct($configs){
            $this->configs=$configs;
        }
        
        public function SetTo($address){
            $this->To=trim($address);
        }
        
        public function SetCode($code){
            $this->Code=$code;
        }
        
        public function buildRequest(){
            $request=array();
            $request['to']=$this->To;
            $request['code']=$this->Code;
            return $request;
        }
        public function verify(){
            $voice=new voice($this->configs);
            return $voice->verify($this->buildRequest());
        }
        
    }