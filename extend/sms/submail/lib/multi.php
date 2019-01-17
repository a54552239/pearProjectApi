<?PHP
    class Multi{

        protected $To='';
        protected $Vars=array();

        public function SetTo($address){
            $this->To=$address;
        }
        
        public function AddVar($key,$val){
            $this->Vars[$key]=$val;
        }
        
        public function Build(){
            $multi=array("to"=>$this->To,"vars"=>$this->Vars);
            unset($this->To);
            unset($this->Vars);
            return $multi;
        }
    }