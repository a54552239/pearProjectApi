<?PHP
    class MESSAGELog{
        
        protected $configs;
        
        protected $recipient='';
        
        protected $project='';
        
        protected $result_status='';
        
        protected $start_date='';
        
        protected $end_date='';
        
        protected $order_by='';
        
        protected $rows='';
        
        protected $offset='';
        
        function __construct($configs){
            $this->configs=$configs;
        }
        
        public function setRecipient($recipient){
            $this->recipient=$recipient;
        }
        
        public function setProject($project){
            $this->project=$project;
        }
        
        public function setResultStatus($result_status){
            if($result_status=='delivered' || $result_status=='dropped'){
                $this->result_status=$result_status;
            }
        }
        
        public function setStartDate($start_date){
            if($start_date!=''){
                $this->start_date=strtotime($start_date);
            }
        }
        
        public function setEndDate($end_date){
            if($end_date!=''){
                $this->end_date=strtotime($end_date);
            }
        }
        
        public function setOrderBy($order_by){
            if($order_by=='asc' || $order_by=='desc'){
                $this->order_by=$order_by;
            }
        }
        
        public function setRows($rows){
            if($rows>=10 && $rows<=1000){
                $this->rows=$rows;
            }
        }
        
        public function setOffset($offset){
            if($offset>=0){
                $this->offset=$offset;
            }
        }
        
        public function buildRequest(){
            $request=array();
            
            if($this->recipient!=''){
                $request['recipient']=$this->recipient;
            }
            
            if($this->project!=''){
                $request['project']=$this->project;
            }
            
            if($this->result_status!=''){
                $request['result_status']=$this->result_status;
            }
            
            if($this->start_date!=''){
                $request['start_date']=$this->start_date;
            }
            
            if($this->end_date!=''){
                $request['end_date']=$this->end_date;
            }
            
            if($this->order_by!=''){
                $request['order_by']=$this->order_by;
            }
            
            if($this->rows!=''){
                $request['rows']=$this->rows;
            }
            
            if($this->offset!=''){
                $request['offset']=$this->offset;
            }
            
            return $request;
        }
        
        public function log(){
            $message=new message($this->configs);
            return $message->log($this->buildRequest());
        }
        
    }