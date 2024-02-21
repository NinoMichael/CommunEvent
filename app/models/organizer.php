<?php

class Organisateur {
    private $id_organisateur;
    private $intitule;
    private $type_organisateur;
    private $img_organisateur;
    private $siege;
    private $contact;
    private $email;
    private $description;
    private $nb_evenement;

    public function __construct($id_organisateur, $intitule, $type_organisateur, $img_organisateur, $siege, $contact, $email,
    $description, $nb_evenement)
    {
        $this->id_organisateur = $id_organisateur;
        $this->intitule = $intitule;
        $this->type_organisateur = $type_organisateur;
        $this->img_organisateur = $img_organisateur;
        $this->siege = $siege;
        $this->contact = $contact;
        $this->email = $email;
        $this->description = $description;
        $this->nb_evenement = $nb_evenement;
    }

    public function getIdOrganisateur() {return $this->id_organisateur;}
    public function setIdOrganisateur($id_organisateur) {$this->id_organisateur = $id_organisateur;}

    public function getIntitule() {return $this->intitule;}
    public function setIntitule($intitule) {$this->intitule = $intitule;}

    public function getTypeOrganisateur() {return $this->type_organisateur;}
    public function setTypeOrganisateur($type_organisateur) {$this->type_organisateur = $type_organisateur;}

    public function getImgOrganisateur() {return $this->img_organisateur;}
    public function setImgOrganisateur($img_organisateur) {$this->img_organisateur = $img_organisateur;}

    public function getSiege() {return $this->siege;}
    public function setSiege($siege) {$this->siege = $siege;}

    public function getContact() {return $this->contact;}
    public function setContact($contact) {$this->contact = $contact;}

    public function getEmail() {return $this->email;}
    public function setEmail($email) {$this->email = $email;}

    public function getDescription() {return $this->description;}
    public function setDescription($description) {$this->description = $description;}

    public function getNbEvenement() {return $this->nb_evenement;}
    public function setNbEvenement($nb_evenement) {$this->nb_evenement = $nb_evenement;}
}
?>