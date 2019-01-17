<?PHP
    class mobiledatapackage{
        
        protected $configs;
        
        function __construct($configs){
            $this->configs=$configs;
        }
        
        public function buildRequest(){
            $request=array();
            return $request;
        }
        public function package(){
            $mobiledata=new mobiledata($this->configs);
            return $mobiledata->package($this->buildRequest());
        }
        
    }