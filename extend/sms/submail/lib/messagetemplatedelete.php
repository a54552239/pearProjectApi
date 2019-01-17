<?PHP
    class MESSAGETemplateDELETE{

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
            
            $request['template_id']=$this->template_id;

            return $request;
        }
        public function deleteTemplate(){
            $message=new message($this->configs);
            return $message->deleteTemplate($this->buildRequest());
        }
        
    }