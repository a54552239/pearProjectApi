<?PHP
    class MESSAGETemplateGET{
        
        protected $configs;
        
        protected $template_id='';
        
        function __construct($configs){
            $this->configs=$configs;
        }
        
        public function SetTemplate($template_id){
            $this->template_id=trim($template_id);
        }
        
        public function buildRequest(){
            $request=array();
            if(!empty($this->template_id)){
                $request['template_id']=$this->template_id;
            }
            return $request;
        }
        public function getTemplate(){
            $message=new message($this->configs);
            return $message->getTemplate($this->buildRequest());
        }
        
    }