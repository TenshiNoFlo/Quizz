class Bouton {
  int type; // Correspond au type de bouton | 0 : Rectangle/Carré | 1 : Rond
  int x, y; // Correspond aux coordonnées | ATTENTION : ELLES CORRESPONDENT AU CENTRE DU BOUTON !
  boolean stroke; // Permet de savoir s'il possède une bordure ou non | True : Oui | False : Non

  // Rectangle/Carré
  int longueur, hauteur; // Correspond à la longueur et à la hauteur du bouton

  // Rond
  int rayon; // Correspond au rayon du bouton

  void initialiser(int type, int x, int y) {
    this.type = type;
    this.x = x;
    this.y = y;

    this.stroke = true;
  }

  void initialiserRectangle(int x, int y, int longueur, int hauteur) {
    this.initialiser(0, x, y);

    this.longueur = longueur;
    this.hauteur = hauteur;
  }

  void initialiserRond(int x, int y, int rayon) {
    this.initialiser(1, x, y);

    this.rayon = rayon;
  }

  void afficher(color couleurBouton) {
    if (!this.stroke) {
      noStroke();
    } else {
      strokeWeight(strokeTaille); // Variable à défini au préalable en globale !
    }
    fill(couleurBouton);

    switch (this.type) {
      // Rectangle/Carré ?
      case 0:
        // Paramètres du Rectangle/Carré
        rectMode(CENTER);

        // Rectangle/Carré
        rect(this.x, this.y, this.longueur, this.hauteur);

        break;
      // Rond ?
      case 1:
        // Rond
        ellipse(this.x, this.y, this.rayon * 2, this.rayon * 2);
        
        break;
    }

    stroke(0);
  }

  void afficherAvecTexte(color couleurBouton, String texte, int texteSize, color texteCouleur) {
    this.afficher(couleurBouton);

    // Paramètres du Texte
    textAlign(CENTER, CENTER);
    textSize(texteSize);
    fill(texteCouleur);

    // Texte
    text(texte, this.x, this.y - 2);
  }

  void enlever() {
    switch(this.type) {
      // Rectangle/Carré ?
      case 0:
        // Paramètres
        this.longueur += strokeTaille / 2;
        this.hauteur += strokeTaille / 2;
        stroke(backgroundColor);

        // Rectangle/Carré
        this.afficher(backgroundColor);

        // Reset Paramètres
        this.longueur -= strokeTaille / 2;
        this.hauteur -= strokeTaille / 2;
        stroke(0);

        break;
      // Rond ?
      case 1:
        // Paramètres
        this.rayon += strokeTaille / 2;
        stroke(backgroundColor);

        // Rectangle/Carré
        this.afficher(backgroundColor);

        // Reset Paramètres
        this.rayon -= strokeTaille / 2;
        stroke(0);
        
        break;
    }
  }
}