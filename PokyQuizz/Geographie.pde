class Geographie { //<>//
  Bouton duo=new Bouton();
  Bouton carre=new Bouton();
  Bouton cash=new Bouton();
  Bouton crazy=new Bouton();

  Bouton rappelMode=new Bouton();
  Bouton rappelLevel=new Bouton();

  //MET LE DEPARTEMENT num EN ROUGE. UTILE POUR MONTRER LES DIFFERENTES PROPOSITIONS. 
  void afficherDepartementRouge(int num) {
    departement[num].beginShape();
    departement[num].fill(255, 0, 0);
    departement[num].endShape(CLOSE);
    shape(departement[num], positionX, positionY);
  }
  // MET LA COULEUR DE TOUS LES DEPARTEMENT EN ROUGE
  void afficherDepartementBleu() {
    for (int i=0; i<departement.length; i++) {
      departement[i].beginShape();
      departement[i].fill(0, 0, 255);
      departement[i].endShape(CLOSE);
    }
  }

  // MET LA COULEUR D'UN DEPARTEMENT EN VERT.
  void afficherDepartementVert(int num) {
    departement[num].beginShape();
    departement[num].fill(0, 255, 0);
    departement[num].endShape(CLOSE);
    shape(departement[num], positionX, positionY);
  }

  //AFFICHE TOUS LES DEPARTEMENT A L'ECRAN
  void afficherDepartements() {
    for (int i=0; i<departement.length; i++) {
      shape(departement[i], positionX, positionY);
    }
  }

  //AFFICHE LA CARTE SANS COUTOUR (en noStroke) POUR LE MODE CRAZY !!!
  void carteCash() {
    for (int i=0; i<departement.length; i++) {
      departement[i].setStroke(color(0, 0, 255));
    }
  }

  // REMET LES CONTOUR APRES LA QUESTION
  void carteContour() {
    for (int i=0; i<departement.length; i++) {
      departement[i].setStroke(0);
    }
  }

  // AFFICHE LA QUESTION DE GEOGRAPHIE DEMANDE EN FONCTION DE SON NUMERO
  void afficherQuestionGeographie(int numero) {
    stroke(0);
    //Géographie a besoin des 2 ligne
    actualiseCarte=loadStrings("Geographie/departement.txt");

    strokeWeight(1);
    departement=geographie.creerCarte(actualiseCarte);
    strokeWeight(strokeTaille);

    String q[]=loadStrings("Geographie/question/g"+numero+".txt"); // on va chercher la question
    //affichage de la question au centre
    background(backgroundColor);
    fill(255);
    stroke(255);
    textSize(34);
    textAlign(CENTER, CENTER);
    text(q[1], width/2, 39);

    stroke(0);
    boutonScore1.afficherAvecTexte(backgroundColor + 50, "SCORE : " + str(score), police, color(255));

    question.afficherModesReponses();
  }
  //AJOUTE TOUS LES DEPARTEMENT A UN TABLEAU QUI IRA DANS departement[]
  PShape[] creerCarte(String tab[]) {
    PShape geographie[]=new PShape[96];
    int compteur=-1; //Garde l'indice du prochain département à mettre dans le tableau
    String coord[]=new String[2];
    String char2int;
    for (int i=0; i<tab.length; i++) {
      if (tab[i].charAt(0)=='d') { //Condition de création d'un nouveau département
        if (compteur>=0) { //condition de fermeture d'un département
          geographie[compteur].endShape(CLOSE);
        }
        if (tab[i].charAt(13)=='b') { // traite les cas de la corse et de l'ain pour qui la formule ne marche pas
          compteur=0;
        }
        if (tab[i].charAt(13)=='a') {
          compteur=20;
        }
        if (!(tab[i].charAt(13)=='a') && !(tab[i].charAt(13)=='b')) {
          char2int=str(tab[i].charAt(12)); // sorcellerie : conversion char au String
          compteur=int(char2int)*10; // String a int
          char2int=str(tab[i].charAt(13));
          compteur+=int(char2int);
        }
        geographie[compteur]=new PShape();
        geographie[compteur]=createShape();
        geographie[compteur].setStroke(true);
        geographie[compteur].beginShape();
        geographie[compteur].fill(0, 0, 255); //bleu
        geographie[compteur].stroke(255); //noir
      } else {
        coord=splitTokens(tab[i], ", ");
        geographie[compteur].vertex(float(coord[0]), float(coord[1]));//on ajoute un point
      }
    }
    return geographie;
  }

  // FONCTION DONNE QUI VERIFIE QUE LE POINT EST DANS LE POLYGON
  boolean PointInPolygon(int x, int y, PShape polygon) {
    int i, j, nvert = polygon.getVertexCount();
    boolean impair = false;
    for (i = 0, j = nvert - 1; i < nvert; j = i, i++) {
      PVector vi = polygon.getVertex(i);
      PVector vj = polygon.getVertex(j);
      if ( ( (vi.y >= y ) != (vj.y >= y) ) && (x <= (vj.x - vi.x) * (y - vi.y) / (vj.y - vi.y) + vi.x)) {
        impair = !impair;
      }
    }
    return impair;
  }



  // AFFICHE LES BOUTONS POUR CHOISIR LE MODE
  void mode() {
    stroke(0);
    duo.initialiserRectangle(350, 250, 250, 150);
    carre.initialiserRectangle(650, 450, 250, 150);
    cash.initialiserRectangle(350, 450, 250, 150);
    crazy.initialiserRectangle(650, 250, 250, 150);

    duo.afficherAvecTexte(backgroundColor+50, "duo", 24, color(255));
    carre.afficherAvecTexte(backgroundColor+50, "carre", 24, color(255));
    cash.afficherAvecTexte(backgroundColor+50, "cash", 24, color(255));
    crazy.afficherAvecTexte(backgroundColor+50, "crazy", 24, color(255));
  }

  //ENLEVE LES BOUTONS PORU CHOISIR LE MODE
  void modeChoisis() {
    duo.enlever();
    carre.enlever();
    cash.enlever();
    crazy.enlever();
    background(0);
  }
  void afficherProposition(int id, int difficulte, int modeDeJeu ) {
    String q[]=loadStrings("Geographie/question/g"+id+".txt"); // on va chercher la question
    //affichage de la question au centre
    background(backgroundColor);
    stroke(0);
    boutonScore1.afficherAvecTexte(backgroundColor + 50, "SCORE : " + str(score), police, color(255));
    fill(255);
    stroke(255);
    textSize(34);
    textAlign(CENTER, CENTER);
    text(q[1], width/2, 39);
    this.afficherDepartements();
    int reponse=int(q[3]);//récuperer la réponse de la question
    reponseActuelleGeographie[0]=reponse;
    rappelMode.initialiserRectangle(100, 450, 100, 50);
    rappelLevel.initialiserRectangle(100, 525, 100, 50);

    String lemode="aucun";
    String leLevel="0";
    stroke(0);
    if (modeDeJeu==1) {lemode="duo";}
    if (modeDeJeu==2) {lemode="carre";}
    if (modeDeJeu==3) {lemode="cash";}
    if (modeDeJeu==4) {lemode="crazy";}

    if (difficulte==1) {leLevel="facile";}
    if (difficulte==2) {leLevel="moyen";}
    if (difficulte==3) {leLevel="difficile"; }

    rappelMode.afficherAvecTexte(backgroundColor+50,lemode, police, color(255));
    rappelLevel.afficherAvecTexte(backgroundColor+50, leLevel, police, color(255));


    //afficher d'autre proposition en fonction de la difficulte
    //MODE DUO
    if (modeDeJeu==1) {
      this.afficherDepartementRouge(reponse);

      if (difficulte==1) {//DIFFIUCLTE 1 RANDOM
        int dejavu[]=new int[8];
        dejavu[0]=reponse;
        int i=1;
        while (i<2) {
          int proposition=int(random(0, 96));
          if (!estDans(dejavu, proposition)) {
            dejavu[i]=proposition;
            reponseActuelleGeographie[i]=dejavu[i];
            this.afficherDepartementRouge(proposition);
            i++;
          }
        }
      }

      if (difficulte==2) { //DIFFICULTE 2 PLUS PROCHE DEPARTEMENT 3 DERNIER
        int t[]=plusProcheDepartement(reponse);
        int compteReponseActuelle=1;
        for (int i=5; i<7; i++) {
          this.afficherDepartementRouge(t[i]);
          reponseActuelleGeographie[compteReponseActuelle]=t[i];
          compteReponseActuelle++;
        }
      }
      if (difficulte==3) { //DIFFICULTE 3 PLUS PROCHE DEPARTEMENT 3 premier
        int t[]=plusProcheDepartement(reponse);
        for (int i=1; i<2; i++) {
          this.afficherDepartementRouge(t[i]);
          reponseActuelleGeographie[i]=t[i];
        }
      }
    }

    //MODE CARRE
    if (modeDeJeu==2) {
      this.afficherDepartementRouge(reponse);

      if (difficulte==1) {//DIFFIUCLTE 1 RANDOM
        int dejavu[]=new int[8];
        dejavu[0]=reponse;
        int i=1;
        while (i<4) {
          int proposition=int(random(0, 96));
          if (!estDans(dejavu, proposition)) {
            dejavu[i]=proposition;
            this.afficherDepartementRouge(proposition);
            reponseActuelleGeographie[i]=dejavu[i];
            i++;
          }
        }
      }
      if (difficulte==2) { //DIFFICULTE 2 PLUS PROCHE DEPARTEMENT 3 DERNIER
        int t[]=plusProcheDepartement(reponse);
        int compteReponseActuelle=1;
        for (int i=5; i<8; i++) {
          this.afficherDepartementRouge(t[i]);
          reponseActuelleGeographie[compteReponseActuelle]=t[i];
          compteReponseActuelle++;
        }
      }
      if (difficulte==3) { //DIFFICULTE 3 PLUS PROCHE DEPARTEMENT 3 premier
        int t[]=plusProcheDepartement(reponse);

        for (int i=1; i<4; i++) {
          this.afficherDepartementRouge(t[i]);
          reponseActuelleGeographie[i]=t[i];
        }
      }
    }
    //FIN MODE CARRE

    //MODE CASH
    if (modeDeJeu==3) {
    }
    //FIN MODE CASH

    //MODE CRAZY
    if (modeDeJeu==4) {
      carteCash();
      this.afficherDepartements();
    }
    //FIN MODE CRAZY
  }

  //VEREIFIE QUE LA VALEUR n SE TROUVE DANS LE TABLEAU D'ENTIER tab
  boolean estDans (int tab[], int n) {
    for (int i=0; i<tab.length; i++) {
      if (n==tab[i]) {
        return true;
      }
    }
    return false;
  }

  //CALCULE LA DISTANCE ENTRE 2 DEPARTEMENT. EST UTILISE POUR LA DIFFICULTE
  float calculeDistance2Departement(PShape d1, PShape d2) { // calcule la distance entre 2 départements
    PVector pointD1=d1.getVertex(1);
    PVector pointD2=d2.getVertex(1);
    return dist(pointD1.x, pointD1.y, pointD2.x, pointD2.y);
  }

  //CALCULE LA DISTANCE ENTRE 2 POINT. UTILE PORU DETERMINER LE NOMBRE DE POINT DU MODE CRAZY
  float calculeDistance2point(float d1, float d2, float point1, float point2) {
    return dist(d1, d2, point1, point2);
  }

  //RENVOIE LES DEPARTEMENT LES PLUS PROCHE DU DEPARTEMENT d. POUR QUE LES DEPARTEMENT AFFICHER S'ADAPATE EN FONCTION DE LA DIFFICULTE
  int[] plusProcheDepartement(int d) { //Renvoie les 4 des 8 départements les plus proches
    int tab[]=new int[8];
    float distanceDepartement[][]=new float[96][2]; // contient la distance du département en case[1] trié dans l'ordre croissant

    for (int i=0; i<distanceDepartement.length; i++) {
      distanceDepartement[i][0]=calculeDistance2Departement(departement[d], departement[i]);
      distanceDepartement[i][1]=i;
    }
    triSelectif(distanceDepartement);
    for (int i=0; i<tab.length; i++) {
      tab[i]=int(distanceDepartement[i][1]);
    }
    return tab;
  }

  // TRI UTILISER POUR QUE LES DEPARTEMENT SOIT RANGER PAR NUMERO. 
  void triSelectif(float t[][]) {
    float temp[]=new float[2];
    int imin;
    for (int i=0; i<t.length-1; i++) {
      imin=i+1;
      for (int j=imin; j<t.length; j++) {
        if (t[imin][0]>t[j][0]) {
          imin=j;
        }
      }
      temp=t[imin];
      t[imin]=t[i];
      t[i]=temp;
    }
  }

  // FONCTION QUI VERIFIE LA VALIDITE DE LA REPONSE ET LE NOMBRE DE POINT OBTENU
  void laReponse(int id, int mode) {
    //POUR LES MODES duo, carre, cash. Calcule de point en fonction de si la réponse est juste ou fausse.
    if (mode>0 && mode<=3) {
      if (mousePressed) {
        if (PointInPolygon(mouseX-positionX, mouseY-positionY, departement[id])) {
          augmenterScore();
          text("BRAVO", 300, 300);
          afficherDepartementVert(id);//montre que la réponse est juste.
          afficherDepartementBleu(); 
          question.etat=0;
          rappelMode.enlever();
          rappelLevel.enlever();
        } else {
          text("Mauvaise Réponse", 300, 300);
          afficherDepartementVert(id); //montre la réponse juste en cas d'erreur
          afficherDepartementBleu();
          question.etat=0;
          rappelMode.enlever();
          rappelLevel.enlever();
        }
      }
    }
    if (mode==4) {
      if (mousePressed) {
        if (PointInPolygon(mouseX-positionX, mouseY-positionY, departement[id])) {
          text("BRAVO vous êtes un génie", 300, 300);
          augmenterScore();
          carteContour();
          question.etat=0;
        }
        PVector reponse=departement[question.id].getVertex(1);
        if (!PointInPolygon(mouseX-positionX, mouseY-positionY, departement[id])) {
          String message="None";
          float distance=calculeDistance2point(mouseX, mouseY, reponse.x+positionX, reponse.y+positionY);
          if (distance>0 && distance<100/level) { //plus la difficulte est élevé. Moins a tolérance d'erreur est élevé.
            message="Vous étiez proche du but";
            score+=mode*level/2;
          }
          if (distance>100/level && distance<200/level) {
            message="ça commence à faire loin quand même";
            score+=int((mode/level)/4);
          }
          if (distance>200/level) {
            message="Révisez et retentez votre chance";
          }
          text(message, 300, 300);
          stroke(255);
          fill(255);
          circle(mouseX, mouseY, 5);
          line(mouseX, mouseY, reponse.x+positionX, reponse.y+positionY);
          carteContour();
          question.etat=0;
        }
        rappelMode.enlever();
        rappelLevel.enlever();
      }
    }
  }
}