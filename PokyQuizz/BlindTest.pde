class BlindTest {

  void afficherQuestion(int id) {
    // Couleur d'arrière plan
    background(backgroundColor);
    
    // Récupération du fichier txt correspondant à l'id de la question
    String[] questionData = loadStrings("BlindTest/Questions/bt" + id + ".txt");

    // Paramètres du Rectangle
    rectMode(CENTER);
    strokeWeight(strokeTaille);
    stroke(0);
    fill(backgroundColor - 5);

    // Paramètre Texte
    textAlign(CENTER, CENTER);
    textSize(police + 10);
    fill(255);

    // Texte
    text(questionData[1], width / 2, 39);
    
    // Paramètres Video
    fill(backgroundColor + 10);

    // Rectangle Video
    rect(width / 2, police + 10 + height / 3, width / 2, height / 2);

    // Bouton Play
    boutonPlay1.afficher(color(backgroundColor + 10));

    // Paramètres Extra Triangle
    fill(0);

    // Extra Triangle
    triangle(boutonPlay1.x + height / 50, boutonPlay1.y, boutonPlay1.x - height / 50, boutonPlay1.y + height / 50, boutonPlay1.x - height / 50, boutonPlay1.y - height / 50);
  
    // Bouton 'score'
    boutonScore1.afficherAvecTexte(backgroundColor + 50, "SCORE : " + str(score), police, color(255));

    // Boutons 'Info'
    boutonInfo1.afficherAvecTexte(backgroundColor + 20, DIFF, police, color(255));

    boutonSon1.afficher(color(0));

    boutonSon3.afficherAvecTexte(backgroundColor + 10, "VOLUME", police, color(255));

    boutonSon2.initialiserRond(boutonSon1.x - boutonSon1.longueur / 2 + (int)(sonVideo * boutonSon1.longueur), boutonSon1.y, 20);
    boutonSon2.afficher(backgroundColor + 10);
  }

  void afficherModesReponses() {
    // Rectangle Central
    boutonTexteCentral1.afficherAvecTexte(backgroundColor - 5, "CHOISISSEZ LE MODE DE RÉPONSE", police + 5, color(255));

    // Afficher Boutons
    boutonCarre1.afficherAvecTexte(backgroundColor + 10, "DUO", police, color(255));
    boutonCarre2.afficherAvecTexte(backgroundColor + 10, "CARRÉ", police, color(255));
    boutonCarre3.afficherAvecTexte(backgroundColor + 10, "CASH", police, color(255));
    boutonCarre4.afficherAvecTexte(backgroundColor + 10, "CRAZY", police, color(255));
  }

  void afficherPropositions(Question question) {
    boutonInfo2.afficherAvecTexte(backgroundColor + 20, question.mode == 1 ? "DUO" : question.mode == 2 ? "CARRÉ" : question.mode == 3 ? "CASH" : "CRAZY", police, color(255));

    // Récupération Fichiers
    String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");
    String[] banqueData = loadStrings("BlindTest/Banque.txt");

    // Variables Utiles
    String propositionActuelle;

    int casesRestantes;
    int indiceProposition;

    boolean end;

    // Remplir Propositions
    switch(question.mode) {

      // Mode : Duo ?
      case 1:
        question.propositionTab = new String[2];
        break;

      // Mode : Carré ?
      case 2:
        question.propositionTab = new String[4];
        break;

      // Mode : Cash/Crazy
      default:
        question.propositionTab = new String[1];
        question.propositionTab[0] = "";

        question.isPlaying = false; // Réutilisation de cette variable afin de savoir si l'utilisateur est en mode 'Clavier'

        break;

    }

    if (question.mode == 1 || question.mode == 2) {
      // Rectangle Central
      boutonTexteCentral1.afficherAvecTexte(backgroundColor - 5, "CHOISIR LA RÉPONSE", police + 5, color(255));

      // Mettre Réponse
      question.propositionTab[(int)random(question.propositionTab.length)] = questionData[3];

      // Remplir Autre(s)
      casesRestantes = question.propositionTab.length - 1;

      while(casesRestantes != 0) {
        indiceProposition = (int)random(question.propositionTab.length);

        if (question.propositionTab[indiceProposition] == null) {
          do {
            propositionActuelle = banqueData[(int)random(banqueData.length)];

            end = true;
            for (int i = 0 ; i < question.propositionTab.length ; i++) {
              if (propositionActuelle.equals(question.propositionTab[i])) {
                end = false;
                break;
              }
            }
          } while (!end);

          question.propositionTab[indiceProposition] = propositionActuelle;
          casesRestantes--;
        }
      }
    } else {
      boutonTexteCentral1.afficherAvecTexte(backgroundColor - 5, "SAISISSEZ LA RÉPONSE", police + 5, color(255));
    }

    // Afficher Propositions
    switch(question.mode) {

      // Mode : Duo ?
      case 1:

        // Afficher Propositions
        boutonDuo1.afficherAvecTexte(backgroundColor + 10, question.propositionTab[0], police, color(255));
        boutonDuo2.afficherAvecTexte(backgroundColor + 10, question.propositionTab[1], police, color(255));

        break;

      // Mode : Carré ?
      case 2:

        // Afficher Propositions
        boutonCarre1.afficherAvecTexte(backgroundColor + 10, question.propositionTab[0], police, color(255));
        boutonCarre2.afficherAvecTexte(backgroundColor + 10, question.propositionTab[1], police, color(255));
        boutonCarre3.afficherAvecTexte(backgroundColor + 10, question.propositionTab[2], police, color(255));
        boutonCarre4.afficherAvecTexte(backgroundColor + 10, question.propositionTab[3], police, color(255));

        break;

      // Mode : Cash ?
      case 3:

        // Afficher Choix
        boutonCash1.afficherAvecTexte(backgroundColor + 10, "NOM DE L'ANIMÉ (ANGLAIS)...", police, color(255, 50));

        break;

      // Mode : Crazy ?
      case 4:

        // Afficher Choix
        boutonCash1.afficherAvecTexte(backgroundColor + 10, "NOM DE L'ANIMÉ (JAPONAIS)...", police, color(255, 50));

        break;

    }
  }
}
