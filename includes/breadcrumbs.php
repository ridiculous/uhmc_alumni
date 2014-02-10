<?php 

$bc_site = "../index.php"; 

$bc_label =  array("faq"=>"Frequent Questions", 
                   "links"=>"Links", 
                   "contact"=>"Contact Info" 
); 




function breadcrumb_nav($basename = "Home") { 

   global $PHP_SELF, $bc_site, $bc_label; 

   $site = $bc_site; 
   $return_str = "<A HREF=\"/\">$basename</A>"; 
   $str = substr(dirname($PHP_SELF), 1); 

   $arr = split('/', $str); 
   $num = count($arr); 

   if ($num > 1){ 

      foreach($arr as $val) { 

         $return_str .= ' &gt; <a href="'.$site.$val.'/">'.$bc_label[$val].'</a>'; 
         $site .= $val.'/'; 

      } 

   } elseif($num == 1) { 

      $arr = $str; 
      $return_str .= ' &gt; <a href="'.$bc_site.$arr.'/">'.$bc_label[$arr].'</a>'; 

   } 

echo $str;

   return $return_str; 

} 
?> 


