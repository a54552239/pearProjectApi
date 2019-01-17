<?PHP
    require 'message.php';
    class MESSAGETemplatePUT{

        protected $configs;
        
        protected $template_id='';
        
        protected $sms_title='';
        
        protected $sms_signature='';
        
        protected $sms_content='';
        
        function __construct($configs){
            $this->configs=$configs;
        }
        
        public function SetTemplate($template_id){
            $this->template_id=trim($template_id);
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
            
            $request['template_id']=$this->template_id;
            
            if(!empty($this->sms_title)){
                $request['sms_title']=$this->sms_title;
            }
            
            $request['sms_signature']=$this->sms_signature;
            
            $request['sms_content']=$this->sms_content;
            
            return $request;
        }
        public function putTemplate(){
            $message=new message($this->configs);
            return $message->putTemplate($this->buildRequest());
        }
        
    }