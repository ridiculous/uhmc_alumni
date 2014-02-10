<?php
// ** MySQL settings ** //
$DB_NAME     = ""; 
$DB_USER     = "";
$DB_PASSWORD = "";
$DB_HOST     = "";


/****************  URL to self **********************/
// if 'REQUEST_URI' isn't available then ...
if(!isset($_SERVER['REQUEST_URI'])) {
   
   // ... set my own request url and ...
   $temp_request_url = $_SERVER['PHP_SELF'];
   
   // ... test for and add url variables to my request url ...
   if (isset($HTTP_SERVER_VARS['QUERY_STRING'])) {
       $temp_request_url .= (strpos($updateGoTo, '?')) ? "&" : "?";
       $temp_request_url .= $HTTP_SERVER_VARS['QUERY_STRING'];
       }

} else {
   // ... otherwise use the regular 'REQUEST_URI'
   $temp_request_url = $_SERVER['REQUEST_URI'];
} 

if ( empty($_SERVER['REQUEST_URI']) ) {
   $arr = explode("/", $_SERVER['PHP_SELF']);
   $_SERVER['REQUEST_URI'] = $arr[count($arr)-1];
} 


if(!isset($_SERVER["DOCUMENT_ROOT"])){
$_SERVER["DOCUMENT_ROOT"]=$str_replace('\\','/',getcwd());
}

$url = $_SERVER['SERVER_NAME']; 
$page = $_SERVER['PHP_SELF']; 

$page_self = "http://".$url.$page; 



/***********************************************************
*  Base URL path
*
*  IMPORTANT !!!   
*  Change the second line to match your folder name.  Here our folder is called "mauiCC"
*
***********************************************************/
$current_server = $_SERVER['SERVER_NAME'];
if($current_server == "localhost"){
	$BASE_URL = "http://$current_server/xampp/uhmc_website";
}else{
	$BASE_URL = "http://" . $current_server . "";
}



/***********************************************************
*  Footer message
***********************************************************/
$currentYear = date("Y");

$footerMsg = "&copy;2006 - {$currentYear} University of Hawai`i Maui College" . "<br>" .
	     "310 Ka'ahumanu Ave | Kahului, HI 96732-1617 | Phone: (808) 984-3267 | <a href=http://maui.hawaii.edu/admserv/mcc_emergency_procedures.php>Emergency Procedures</a> | <a href=http://www.mauicc.biz/helpdesk/step_one.asp target=_blank>Feedback Form</a><br>" . 
	     "An Equal Opportunity/Affirmative Action Institution<br>" .
	     "People requiring an alternate format, call (808) 984-3267 for assistance";

?>