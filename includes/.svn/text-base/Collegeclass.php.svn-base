<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Collegeclass
 *
 * @author Ryan
 */
class College {

    public $Title = "University of Hawaii Maui College ";
    public $Header;
    public $Partial;
    public $Page;
    public $Bcrumb;

    public function setPage($p) {
        $this->Page = $p;
    }

    public function setPartial() {
        switch ($this->Page) {
            case "student":
                $this->Partial = "_column_1.php";
            default:
                $this->Partial = "_main.php";
        }
    }

}

?>
