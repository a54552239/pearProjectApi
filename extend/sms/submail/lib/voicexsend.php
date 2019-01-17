<?PHP
    class VOICEXsend{
        
        protected $configs;
        
        protected $To=array();
        
        protected $Addressbook=array();
        
        protected $Project='';
        
        protected $Vars=array();
        
        function __construct($configs){
            $this->configs=$configs;
        }
        
        public function SetTo($address){
            $this->To=trim($address);
        }
        
        public function SetProject($project){
            $this->Project=$project;
        }
        
        public function AddVar($key,$val){
            $this->Vars[$key]=$val;
        }
        
        public function buildRequest(){
            $request=array();
            $request['to']=$this->To;
            if(!empty($this->Addressbook)){
                $request['addressbook']='';
                foreach($this->Addressbook as $tmp){
                    $request['addressbook'].=$tmp.',';
                }
                $request['addressbook'] = substr($request['addressbook'],0,count($request['addressbook'])-2);
            }
            
            $request['project']=$this->Project;
            if(!empty($this->Vars)){
                $request['vars']=json_encode($this->Vars);
            }
            return $request;
        }
        public function xsend(){
            $voice=new voice($this->configs);
            return $voice->xsend($this->buildRequest());
        }
        
    }
