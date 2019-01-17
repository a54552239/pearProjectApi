<?PHP
    class MESSAGEMultiXsend{
        protected $configs;

        protected $Multi=array();

        protected $Project='';
        
        function __construct($configs){
            $this->configs=$configs;
        }

        public function AddMulti($multi){
            array_push($this->Multi,$multi);
        }
        
        public function AddAddressbook($addressbook){
            array_push($this->Addressbook,$addressbook);
        }

        public function SetProject($project){
            $this->Project=$project;
        }
        
        public function buildRequest(){
            $request=array();
            $request['project']=$this->Project;
            if(!empty($this->Multi)){
                $request['multi']=json_encode($this->Multi);
            }
            return $request;
        }

        public function multixsend(){
            $message=new message($this->configs);
            return $message->multixsend($this->buildRequest());
        }
        
    }