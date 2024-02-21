<?php

class Map {
    private $code_carte;
    private $coord_lat;
    private $coord_long;

    public function __construct($code_carte, $coord_lat, $coord_long)
    {
        $this->code_carte = $code_carte;
        $this->$coord_lat = $coord_lat;
        $this->$coord_long = $coord_long;
    }

    public function getCodeCarte() {return $this->code_carte;}
    public function setCodeCarte($code_carte) {$this->code_carte = $code_carte;}

    public function getCoordLat() {return $this->coord_lat;}
    public function setCoordLat($coord_lat) {$this->coord_lat = $coord_lat;}

    public function getCoordLong() {return $this->coord_long;}
    public function setCoordLong($coord_long) {$this->coord_long = $coord_long;}
}

?>