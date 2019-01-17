<?PHP
    class MESSAGETemplatePOST{
        
        protected $configs;
        
        protected $sms_title='';
        
        protected $sms_signature='';
        
        protected $sms_content='';
        
        function __construct($configs){
            $this->configs=$configs;
        }
        
        public function SetTitle($sms_title){
            $this->sms_title=trim($sms_title);
        }
        
        public function SetSignature($sms_signature){
            $this->sms_signature=trim($sms_signature);
        }
        
        public function SetContent($sms_content){
            $this->sms_content=trim($sms_content);
        }
        
        public function buildRequest(){
            $request=array();
            if(!empty($this->sms_title)){
                $request['sms_title']=$this->sms_title;
            }
            
            $request['sms_signature']=$this->sms_signature;
            
            $request['sms_content']=$this->sms_content;
            
            return $request;
        }
        public function postTemplate(){
            $message=new message($this->configs);
            return $message->postTemplate($this->buildRequest());
        }
        
    }