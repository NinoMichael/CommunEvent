<?php

class User {
    private $nom;
    private $prenom;
    private $age;
    private $sexe;
    private $date_naissance;
    private $lieu_naissance;
    private $img_user;
    private $cin;
    private $adresse;
    private $fokontany;
    private $commune;
    private $ville;
    private $contact;
    private $email;
    private $password;

    public function __construct($nom, $prenom, $age, $sexe, $date_naissance, $lieu_naissance, $img_user, $cin, $adresse, 
    $fokontany, $commune, $ville, $contact, $email, $password)
    {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->age = $age;
        $this->sexe = $sexe;
        $this->date_naissance = $date_naissance;
        $this->lieu_naissance = $lieu_naissance;
        $this->img_user = $img_user;
        $this->cin = $cin;
        $this->adresse = $adresse;
        $this->fokontany = $fokontany;
        $this->commune = $commune;
        $this->ville = $ville;
        $this->contact = $contact;
        $this->email = $email;
        $this->password = $password;
    }

    public function getNom() {return $this->nom;}
    public function setNom($nom) {$this->nom = $nom;}

    public function getPrenom() {return $this->prenom;}
    public function setPrenom($prenom) {$this->prenom = $prenom;}

    public function getAge() {return $this->age;}
    public function setAge($age) {$this->age = $age;}

    public function getSexe() {return $this->sexe;}
    public function setSexe($sexe) {$this->sexe = $sexe;}

    public function getDateNaissance() {return $this->date_naissance;}
    public function setDateNaissance($date_naissance) {$this->date_naissance = $date_naissance;}

    public function getLieuNaissance() {return $this->lieu_naissance;}
    public function setLieuNaissance($lieu_naissance) {$this->lieu_naissance = $lieu_naissance;}

    public function getImgUser() {return $this->img_user;}
    public function setImgUser($img_user) {$this->img_user = $img_user;}

    public function getCin() {return $this->cin;}
    public function setCin($cin) {$this->cin = $cin;}

    public function getAdresse() {return $this->adresse;}
    public function setAdresse($adresse) {$this->adresse = $adresse;}

    public function getFokontany() {return $this->fokontany;}
    public function setFokontany($fokontany) {$this->fokontany = $fokontany;}

    public function getCommune() {return $this->commune;}
    public function setCommune($commune) {$this->commune = $commune;}

    public function getVille() {return $this->ville;}
    public function setVille($ville) {$this->ville = $ville;}

    public function getContact() {return $this->contact;}
    public function setContact($contact) {$this->contact = $contact;}
    
    public function getEmail() {return $this->email;}
    public function setEmail($email) {$this->email = $email;}
    
    public function getPassword() {return $this->password;}
    public function setPassword($password) {$this->password = $password;}
}

?>