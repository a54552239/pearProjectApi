<?PHP
    class MESSAGEMultiSend{
        protected $configs;

        protected $Multi=array();

        protected $Content='';
        
        function __construct($configs){
            $this->configs=$configs;
        }

        public function AddMulti($multi){
            array_push($this->Multi,$multi);
        }
        
        public function SetContent($content){
            $this->Content=$content;
        }
        
        public function buildRequest(){
            $request=array();
            $request['content']=$this->Content;
            if(!empty($this->Multi)){
                $request['multi']=json_encode($this->Multi);
            }
            return $request;
        }

        public function multisend(){
            $message=new message($this->configs);
            return $message->multisend($this->buildRequest());
        }
        
    }