class Histoire{
  color background; // Couleur correspondante à la couleur de fond
  int strokeWeight; // Nombre correspondant à l'épaisseur d'un coup de stylo
  int textSize; // Nombre correspondant à la taille de la police d'écrite | textSize : normal | textSize + 10 : titre
  int idQuestion;

  void initialiser(color background, int strokeWeight, int textSize) {
    this.background = background;
    this.strokeWeight = strokeWeight;
    this.textSize = textSize;
  }
  
  void afficherQuestion(int idQuestion) {
    // Définir la couleur de fond
    background(this.background);
    
    // Récupération du fichier txt correspondant à l'id de la question
    String[] questionTab = loadStrings("Histoire/Questions/h"+ idQuestion +".txt");
    
    // Affichage de la question

    // Intitulé de la question
    fill(255);
    textAlign(CENTER, TOP);
    textSize(this.textSize + 10);
    text(questionTab[1], width / 2, 25);
    
    int reponse = Integer.valueOf(questionTab[3]);

    question.afficherModesReponses();
  }
  
  void afficherModesReponses(){
    // CHOIX DU MODE
    // Paramètres des rectangles
    stroke(0);
    fill(this.background + 10);
    strokeWeight(this.strokeWeight);
    rectMode(CENTER);

    // Rectangle 1
    Bouton R1 = new Bouton();
    R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10, width / 3, height / 10);
    R1.afficherAvecTexte(background+50, "Duo", police, color(255));

    // Rectangle 2
    Bouton R2 = new Bouton();
    R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10, width / 3, height / 10);
    R2.afficherAvecTexte(background+50, "Carré", police, color(255));

    // Rectangle 3
    Bouton R3 = new Bouton();
    R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 10 + 25, width / 3, height / 10);
    R3.afficherAvecTexte(background+50, "Cash", police, color(255));

    // Rectangle 4
    Bouton R4 = new Bouton();
    R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 10 + 25, width / 3, height / 10);
    R4.afficherAvecTexte(background+50, "Crazy", police, color(255));
    
  }
  
  void afficherPropositions(int id, int mode) {
    // Rectangle 1
    Bouton R1 = new Bouton();
    R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10, width / 3, height / 10);
    R1.enlever();

    // Rectangle 2
    Bouton R2 = new Bouton();
    R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10, width / 3, height / 10);
    R2.enlever();

    // Rectangle 3
    Bouton R3 = new Bouton();
    R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 10 + 25, width / 3, height / 10);
    R3.enlever();

    // Rectangle 4
    Bouton R4 = new Bouton();
    R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 10 + 25, width / 3, height / 10);
    R4.enlever();

    String[] questionTab = loadStrings("Histoire/Questions/h"+ question.id +".txt");
    int reponse=Integer.valueOf(questionTab[3]);
    // Récupération des fichiers txt  
    int[] propositionsData = new int[5];
    ; // Variables utiles
    //String[] propositionsTab; // Tableau qui contient les propositions
    String propositionActuelle;

    int casesRestantes;
    int indiceProposition;

    boolean end;

    // Quel mode ?
    switch(mode) {
      // Crazy ?
      case 4:
      
      // Création des propositions
        propositionsData[0] = int(reponse/100)*100;
        propositionsData[1] = int(reponse/100+1)*100;
        propositionsData[4] = reponse;
        
        propositionsTab[0] = propositionsData[0];
        propositionsTab[1] = propositionsData[1];
        propositionsTab[4] = propositionsData[4];
      
      // Paramètres des rectangles
        fill(this.background + 50);
        strokeWeight(this.strokeWeight);
        rectMode(CENTER);
        
        // Rectangle FRISE
        Bouton FRISE = new Bouton();
        FRISE.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 4 + height / 12 + 15, int(width / 1.5), height / 10);
        FRISE.afficherAvecTexte(background+50, "", police, color(255));
        
        fill(255);
        textSize(police);
        text(propositionsData[0],width / 6, height-100);
        text(propositionsData[1],width - width / 6, height-100);
        
        
        break;
      // Cash ?
      case 3:
      
        // Création des propositions
        propositionsData[0]=reponse;
        propositionsData[4] = reponse;
        
        propositionsTab[0] = propositionsData[0];
        propositionsTab[4] = propositionsData[4];
        
        // Paramètres des rectangles
        fill(this.background + 50);
        strokeWeight(this.strokeWeight);
        rectMode(CENTER);
        
        
        Bouton REPONSE = new Bouton();
        REPONSE.initialiserRectangle(width / 2, height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 8);
        REPONSE.afficherAvecTexte(background+50, "Votre réponse...", police, color(255));
        

        
        break;
      // Carré ?
      case 2:
        
        // Création des propositions
        if(level == 1){
          propositionsData[0]=reponse+int(random(25,50));
          propositionsData[1]=reponse+int(random(50,90));
          propositionsData[2]=reponse+int(random(-90,-25));
          propositionsData[3]=reponse;
        } else if(level == 2){
          propositionsData[0]=reponse+int(random(15,25));
          propositionsData[1]=reponse+int(random(25,45));
          propositionsData[2]=reponse+int(random(-45,-15));
          propositionsData[3]=reponse;
        } else if(level == 3){
          propositionsData[0]=reponse+int(random(1,2));
          propositionsData[1]=reponse+int(random(2,4));
          propositionsData[2]=reponse+int(random(-4,-1));
          propositionsData[3]=reponse;
        }
        for(int i=0;i<1000;i++){
          int a = int(random(4));
          int b = int(random(4));
          int temp = propositionsData[a];
          propositionsData[a]=propositionsData[b];
          propositionsData[b]=temp;
        }
        propositionsData[4] = reponse;
        
        propositionsTab[0] = propositionsData[0];
        propositionsTab[1] = propositionsData[1];
        propositionsTab[2] = propositionsData[2];
        propositionsTab[3] = propositionsData[3];
        propositionsTab[4] = propositionsData[4];
        
      
        // Paramètres des rectangles
        fill(this.background + 10);
        strokeWeight(this.strokeWeight);
        rectMode(CENTER);

        // Rectangle 1
        R1 = new Bouton();
        R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
        R1.afficherAvecTexte(background+50, String.valueOf(propositionsData[0]), police, color(255));

        // Rectangle 2
        R2 = new Bouton();
        R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
        R2.afficherAvecTexte(background+50, String.valueOf(propositionsData[1]), police, color(255));

        // Rectangle 3
        R3 = new Bouton();
        R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
        R3.afficherAvecTexte(background+50, String.valueOf(propositionsData[2]), police, color(255));

        // Rectangle 4
        R4 = new Bouton();
        R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
        R4.afficherAvecTexte(background+50, String.valueOf(propositionsData[3]), police, color(255));

        break;
      // Duo ?
      case 1:
      
      // Création des propositions
        if(level == 1){
          propositionsData[0]=reponse+int(random(25,50));
          propositionsData[1]=reponse-int(random(25,50));
        } else if(level == 2){
          propositionsData[0]=reponse+int(random(15,25));
          propositionsData[1]=reponse-int(random(15,25));
        } else if(level == 3){
          propositionsData[0]=reponse+int(random(1,4));
          propositionsData[1]=reponse-int(random(1,4));
        }
        for(int i=0;i<500;i++){
          int a = int(random(2));
          int b = int(random(2));
          int temp = propositionsData[a];
          propositionsData[a]=propositionsData[b];
          propositionsData[b]=temp;
        }
        propositionsData[4] = reponse;
        propositionsTab[0] = propositionsData[0];
        propositionsTab[4] = propositionsData[4];
      
        // Paramètres des rectangles
        fill(this.background + 50);
        strokeWeight(this.strokeWeight);
        rectMode(CENTER);
        
        // Rectangle AVANT
        Bouton AVANT = new Bouton();
        AVANT.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
        AVANT.afficherAvecTexte(background+50, "AVANT", police, color(255));

        // Rectangle APRES
        Bouton APRES = new Bouton();
        APRES.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
        APRES.afficherAvecTexte(background+50, "APRES", police, color(255));
        
        // Rectangle PROP
        Bouton PROP = new Bouton();
        PROP.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 6, height / 10);
        PROP.afficherAvecTexte(background+50, String.valueOf(propositionsData[0]), police, color(255));

        
        break;
    }
    
        String NIV = "";
        if(level == 1){
          NIV = "Facile";
        }
        if(level == 2){
          NIV = "Moyen";
        }
        if(level == 3){
          NIV = "Difficle";
        }
        
        String MODE = "";
        if(question.mode == 1){
          MODE = "Duo";
        }
        if(question.mode == 2){
          MODE = "Carré";
        }
        if(question.mode == 3){
          MODE = "Cash";
        }
        if(question.mode == 4){
          MODE = "Crazy";
        }
    
        Bouton DIFF = new Bouton();
        DIFF.initialiserRectangle(width / 4 + 50, height / 3 +50, width / 3, height / 7);
        DIFF.afficherAvecTexte(background+100, "DIFFICULTE : " + NIV, police, color(255));

        // Rectangle MODES
        Bouton MODES = new Bouton();
        MODES.initialiserRectangle(width - width / 4 - 50, height / 3 +50, width / 3, height / 7);
        MODES.afficherAvecTexte(background+100, "MODE : " + MODE, police, color(255));
  }
}