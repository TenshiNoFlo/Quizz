// DEBUT 'IMPORTS'

import processing.video.*;
import processing.sound.*;

// FIN 'IMPORTS'



// DÉBUT 'QUESTION' //

Question question;

int nbQuestionsRestantes = 10; // Nombre de questions au sein d'une partie

final int nbQuestionsHistoire = 17; // Nombre de questions dans le thème 'Histoire'
final int nbQuestionsGeographie = 96; // Nombre de questions dans le thème 'Geographie'
final int nbQuestionsAnime = 20; // Nombre de questions dans le thème 'Anime'

int[] questionsHistoire;
int[] questionsGeographie;
int[] questionsAnime;

boolean premiereQuestion = true; // Sert à savoir s'il s'agit de la première question

float sonVideo = 0.5;

// FIN 'QUESTION' //



// DEBUT 'BOUTON' //

// Boutons 'Duo'
Bouton boutonDuo1 = new Bouton();
Bouton boutonDuo2 = new Bouton();

// Boutons 'Carré'
Bouton boutonCarre1 = new Bouton();
Bouton boutonCarre2 = new Bouton();
Bouton boutonCarre3 = new Bouton();
Bouton boutonCarre4 = new Bouton();

// Boutons 'Cash'
Bouton boutonCash1 = new Bouton();
Bouton boutonCash2 = new Bouton();

// Bouton 'Play'
Bouton boutonPlay1 = new Bouton();
Bouton boutonPlay2 = new Bouton();
Bouton boutonPlay3 = new Bouton();

// Bouton 'TexteCentral'
Bouton boutonTexteCentral1 = new Bouton();

// Bouton 'Score'
Bouton boutonScore1 = new Bouton();

// Boutons 'Info'
Bouton boutonInfo1 = new Bouton();
Bouton boutonInfo2 = new Bouton();

// Boutons 'Son'
Bouton boutonSon1 = new Bouton();
Bouton boutonSon2 = new Bouton();
Bouton boutonSon3 = new Bouton();

// FIN 'BOUTON' //



// DEBUT 'ENTRE 2 QUESTIONS'

boolean chargerProchaineQuestion = false; // Sert à savoir s'il faut relancer une question
int tempsPause = 1000; // Temps d'arrêt entre 2 Questions
int debutPause = millis(); // Initialisation à 0

// FIN 'ENTRE 2 QUESTIONS'



// DEBUT 'FENETRE'

boolean LOBBY = true;
boolean LANCE = false;
boolean JEU = false;
boolean CLEAR = false;
boolean FIRSTTIME = true;

final int longueur = 1000;
final int largeur = 600;
final color backgroundColor = color(50);

int police = 24;
int strokeTaille = 4;

// FIN 'FENETRE'



// DEBUT 'THEME'

BlindTest blindtest = new BlindTest();
Geographie geographie = new Geographie();
Histoire histoire = new Histoire();

// FIN 'THEME'



// DEBUT 'GEOGRAPHIE'

PShape[] departement = new PShape[96];
int positionX = 400; //position X de la carte sur l'écran
int positionY = 60; // position Y de la carte sur l'écran
String[] actualiseCarte;
int[] reponseActuelleGeographie = new int[5];
Bouton fin =new Bouton();
Bouton scoreFinal=new Bouton();

// FIN 'GEOGRAPHIE'



// DEBUT 'HISTOIRE'

int[] propositionsTab = new int[5];
int date = 0;
boolean BR = false;

// FIN 'HISTOIRE'



// DEBUT 'AUTRE'

Movie[] videos = new Movie[nbQuestionsAnime];

int level;
int score = 0;

int minChars = 5;
int maxChars = 30;

char[] tmp = new char[9];

String PSEUDO = "";
String DIFF = "";
boolean[] themes = new boolean[3];
boolean pret = false;
boolean ecriture = false;
int cpt = 0;
boolean clique = false;

int debutVideo = 4;
int indiceVideo = 0;
boolean reset=false;

SoundFile Menu;

// FIN 'AUTRE'



void settings() {

  //PAGE DE BASE
  size(longueur, largeur);
}



void setup() {

  // Boutons 'Duo'
  boutonDuo1.initialiserRectangle(width / 4 + 50, police + 25 + height / 3 + height / 4 + height / 12 + (height / 10 + 25) / 2, width / 3, height / 10);
  boutonDuo2.initialiserRectangle(width - width / 4 - 50, police + 25 + height / 3 + height / 4 + height / 12 + (height / 10 + 25) / 2, width / 3, height / 10);

  // Boutons 'Carré'
  boutonCarre1.initialiserRectangle(width / 4 + 50, police + 25 + height / 3 + height / 4 + height / 12, width / 3, height / 10);
  boutonCarre2.initialiserRectangle(width - width / 4 - 50, police + 25 + height / 3 + height / 4 + height / 12, width / 3, height / 10);
  boutonCarre3.initialiserRectangle(width / 4 + 50, police + 50 + height / 3 + height / 4 + height / 10 + height / 12, width / 3, height / 10);
  boutonCarre4.initialiserRectangle(width - width / 4 - 50, police + 50 + height / 3 + height / 4 + height / 10 + height / 12, width / 3, height / 10);

  // Boutons 'Cash'
  boutonCash1.initialiserRectangle(width / 2, police + 25 + height / 3 + height / 4 + height / 12, (int)(width / 1.4), height / 10);
  boutonCash2.initialiserRond(width / 2, police + 50 + height / 3 + height / 4 + height / 10 + height / 12, height / 20);
  
  // Bouton 'Play'
  boutonPlay1.initialiserRond(width / 2, police + 10 + height / 3, height / 20);
  boutonPlay2.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 3, width / 2, height / 20);

  // Bouton 'TexteCentral'
  boutonTexteCentral1.initialiserRectangle(width / 2, police + 10 + height / 3, (int)(width / 1.8), height / 10);

  // Bouton 'score'
  boutonScore1.initialiserRectangle((width / 2 - width / 4) / 2, police + 10 + height / 6, 200, 50);

  // Boutons 'Info'
  boutonInfo1.initialiserRectangle(width / 2 + width / 4 + (width - (width / 2 + width / 4)) / 2, police + 10 + height / 6, 200, 50);
  boutonInfo2.initialiserRectangle(width / 2 + width / 4 + (width - (width / 2 + width / 4)) / 2, height / 3 + height / 4 - 16, 200, 50);

  // Boutons 'Son'
  boutonSon1.initialiserRectangle(boutonPlay2.x, boutonPlay2.y + height / 12, boutonPlay2.longueur, boutonPlay2.hauteur / 3);
  boutonSon3.initialiserRectangle((boutonPlay2.x - boutonPlay2.longueur / 2) / 2, boutonPlay2.y + height / 12, boutonPlay2.longueur / 3, boutonPlay2.hauteur + 10);

  // INIT THEMES
  for (int i=0; i<3; i++) {
  themes[i] = false;
  }

  // FOND IMAGE
  background(backgroundColor);

  // TITRE
  stroke(153);
  textSize(64);
  //textAlign(CENTER, BOTTOM);
  //text("PokyQuizz", width/2, height/4);
  tmp[0]='P';
  tmp[1]='O';
  tmp[2]='K';
  tmp[3]='Y';
  tmp[4]='Q';
  tmp[5]='U';
  tmp[6]='I';
  tmp[7]='Z';
  tmp[8]='Z';
  
  if(LOBBY){
    // BOUTON JOUER
    Bouton JOUER = new Bouton();
    JOUER.initialiserRectangle(width / 2, height / 3 + 50, width / 5, height / 8);
    JOUER.afficherAvecTexte(backgroundColor+50, "JOUER", police, color(255));
    
    // BOUTON PARAMETRE
    Bouton PARAMETRE = new Bouton();
    PARAMETRE.initialiserRectangle(width / 2, height - 100, width / 4, height / 8);
    PARAMETRE.afficherAvecTexte(backgroundColor+50, "PARAMETRES", police, color(255));
  }
    
  actualiseCarte=loadStrings("Geographie/departement.txt");
  departement=geographie.creerCarte(actualiseCarte);

  histoire.initialiser(backgroundColor, strokeTaille, police);

  Menu = new SoundFile(this, "Menu/menu.mp3");
  Menu.amp(0.5);
  Menu.loop();
}



void draw() {
  
  // MENU PRINCIPAL
  if (LOBBY) {
    if(inJouer()){
        Bouton JOUER = new Bouton();
        JOUER.initialiserRectangle(width / 2, height / 3 + 50, width / 5, height / 8);
        JOUER.afficherAvecTexte(backgroundColor+80, "JOUER", police, color(255));
    }
    else{
        Bouton JOUER = new Bouton();
        JOUER.initialiserRectangle(width / 2, height / 3 + 50, width / 5, height / 8);
        JOUER.afficherAvecTexte(backgroundColor+50, "JOUER", police, color(255));
    }
    
    if(inParametre()){
      Bouton PARAMETRE = new Bouton();
      PARAMETRE.initialiserRectangle(width / 2, height - 100, width / 4, height / 8);
      PARAMETRE.afficherAvecTexte(backgroundColor+80, "PARAMETRES", police, color(255));
    }
    else{
      Bouton PARAMETRE = new Bouton();
      PARAMETRE.initialiserRectangle(width / 2, height - 100, width / 4, height / 8);
      PARAMETRE.afficherAvecTexte(backgroundColor+50, "PARAMETRES", police, color(255));
    }
    
    // TITRE
    fill(backgroundColor);
    stroke(backgroundColor);
    rect(0,0,width*2,300);
    noStroke();
    fill(255);
    textAlign(CENTER, CENTER);
    textWithPopup(tmp, height/6);

  }
  
  // CHOIX DES OPTIONS
  if (LANCE) {

    stroke(0);
    strokeWeight(strokeTaille);
    // BOUTON NOM
    if(inNom()){
      cursor(TEXT);
      Bouton NOM = new Bouton();
      NOM.initialiserRectangle(width / 2, height / 2 + height / 20 - 100, width / 2, height / 10);
      NOM.afficherAvecTexte(backgroundColor+80, "PSEUDO : " + PSEUDO, police, color(255));
    }
    else{
      cursor(ARROW);
      Bouton NOM = new Bouton();
      NOM.initialiserRectangle(width / 2, height / 2 + height / 20 - 100, width / 2, height / 10);
      NOM.afficherAvecTexte(backgroundColor+50, "PSEUDO : " + PSEUDO, police, color(255));
    }
    
    // BOUTON DIFFICULTE
    if(inDifficulte()){
      Bouton DIFFICULTE = new Bouton();
      DIFFICULTE.initialiserRectangle(width / 2, height / 2 + height / 20, width / 3, height / 10);
      DIFFICULTE.afficherAvecTexte(backgroundColor+80, "DIFFICULTE : " + DIFF, police, color(255));
    }
    else{
      Bouton DIFFICULTE = new Bouton();
      DIFFICULTE.initialiserRectangle(width / 2, height / 2 + height / 20, width / 3, height / 10);
      DIFFICULTE.afficherAvecTexte(backgroundColor+50, "DIFFICULTE : " + DIFF, police, color(255));
    }
    
    // BOUTON T1
    if(inT1()){
      if(themes[0]==false){
        Bouton T1 = new Bouton();
        T1.initialiserRectangle(width / 4 - 50, height / 2 + height / 20 + 125, width / 4, height / 8);
        T1.afficherAvecTexte(backgroundColor+80, "HISTOIRE", police, color(255));
      }
    }
    else{
      if(themes[0]==false){
        Bouton T1 = new Bouton();
        T1.initialiserRectangle(width / 4 - 50, height / 2 + height / 20 + 125, width / 4, height / 8);
        T1.afficherAvecTexte(backgroundColor+50, "HISTOIRE", police, color(255));
      }
    }
    
    // BOUTON T2
    if(inT2()){
      if(themes[1]==false){
        Bouton T2 = new Bouton();
        T2.initialiserRectangle(width / 2, height / 2 + height / 20 + 125, width / 4, height / 8);
        T2.afficherAvecTexte(backgroundColor+80, "GEOGRAPHIE", police, color(255));
      }
    }
    else{
      if(themes[1]==false){
        Bouton T2 = new Bouton();
        T2.initialiserRectangle(width / 2, height / 2 + height / 20 + 125, width / 4, height / 8);
        T2.afficherAvecTexte(backgroundColor+50, "GEOGRAPHIE", police, color(255));
      }
    }
    
    // BOUTON T3
    if(inT3()){
      if(themes[2]==false){
        Bouton T3 = new Bouton();
        T3.initialiserRectangle(width - width / 4 + 50, height / 2 + height / 20 + 125, width / 4, height / 8);
        T3.afficherAvecTexte(backgroundColor+80, "ANIME", police, color(255));
      }
    }
    else{
      if(themes[2]==false){
        Bouton T3 = new Bouton();
        T3.initialiserRectangle(width - width / 4 + 50, height / 2 + height / 20 + 125, width / 4, height / 8);
        T3.afficherAvecTexte(backgroundColor+50, "ANIME", police, color(255));
      }
    }
    
    // BOUTON VALIDE
    if(inValide()){
      if(cpt == 0){
        Bouton VALIDE = new Bouton();
        VALIDE.initialiserRectangle(width / 2, height - 40, width / 5, height / 10);
        VALIDE.afficherAvecTexte(color(200,0,0), "VALIDER", police, color(255));
        pret = false;
      }
      else{
        Bouton VALIDE = new Bouton();
        VALIDE.initialiserRectangle(width / 2, height - 40, width / 5, height / 10);
        VALIDE.afficherAvecTexte(color(0,200,0), "VALIDER", police, color(255));
        pret = true;
        }
      }
    else{
      if(cpt == 0){
        Bouton VALIDE = new Bouton();
        VALIDE.initialiserRectangle(width / 2, height - 40, width / 5, height / 10);
        VALIDE.afficherAvecTexte(color(180,0,0), "VALIDER", police, color(255));
        pret = false;
      }
      else{
        Bouton VALIDE = new Bouton();
        VALIDE.initialiserRectangle(width / 2, height - 40, width / 5, height / 10);
        VALIDE.afficherAvecTexte(color(0,180,0), "VALIDER", police, color(255));
        pret = true;
        }
    }
    
    // TITRE
    fill(backgroundColor);
    stroke(backgroundColor);
    rect(0,0,width*2,300);
    noStroke();
    fill(255);
    textAlign(CENTER, CENTER);
    textWithPopup(tmp, height/6);
    
    
    // TEST POUR JEU
    if(DIFF!="" && PSEUDO!=""){
      cpt=0;
      for(int i=0;i<3;i++){
        if(themes[i] == true){
          cpt++;
        }
      }
    }
    
  }
  
  // LANCEMENT DU JEU
  if (JEU) {
    Menu.stop();
    if (FIRSTTIME) {
      FIRSTTIME = false;

      surface.setVisible(true);

      // ICI
      jouer();
    }

    if (chargerProchaineQuestion) {
      if (millis() >= debutPause + tempsPause) {
        chargerProchaineQuestion = false;
        questionSuivante();
      }
    }
    
    switch(question.theme) {

      // Question en cours : BlindTest ?
      case 2:
        
        switch(question.etat) {

          // Etat en cours : Question ?
          case 1:

            if (dist(mouseX, mouseY, boutonSon2.x, boutonSon2.y) < boutonSon2.rayon && mousePressed && mouseButton == LEFT && clique && mouseX > boutonSon1.x - boutonSon1.longueur / 2 && mouseX < boutonSon1.x + boutonSon1.longueur / 2) {
              sonVideo = (mouseX - (boutonSon1.x - boutonSon1.longueur / 2)) * 1.0 / boutonSon1.longueur;

              videos[question.id].volume(sonVideo);

              boutonSon2.enlever();
              boutonSon1.afficher(color(0));
              boutonSon3.afficherAvecTexte(backgroundColor + 10, "VOLUME", police, color(255));
              boutonSon2.initialiserRond(boutonSon1.x - boutonSon1.longueur / 2 + (int)(sonVideo * boutonSon1.longueur), boutonSon1.y, 20);
              boutonSon2.afficher(backgroundColor + 10);

              boutonSon2.afficher(color(backgroundColor + 50));
            } else {
              boutonSon2.afficher(color(backgroundColor + 10));
            }

            // Bouton 'Play' jamais été pressé ?
            if (!question.isPlaying && !question.isEnd) {
              // Bouton 'Play' survolé ?
              if (dist(mouseX, mouseY, boutonPlay1.x, boutonPlay1.y) < boutonPlay1.rayon) {
                boutonPlay1.afficher(color(backgroundColor + 70));
              } else {
                boutonPlay1.afficher(color(backgroundColor + 30));
              }

              fill(0);
              triangle(boutonPlay1.x + height / 50, boutonPlay1.y, boutonPlay1.x - height / 50, boutonPlay1.y + height / 50, boutonPlay1.x - height / 50, boutonPlay1.y - height / 50);
            }

            // Video en cours de 'lecture' ?
            else if (question.isPlaying && !question.isEnd) {
              image(videos[question.id], width / 2 - width / 4 + strokeTaille / 2, height / 3 + police + 10 - height / 4 + strokeTaille / 2, width / 2 - strokeTaille / 2 - 1, height / 2 - strokeTaille / 2 - 1);
            
              // Bouton 'score'
              boutonScore1.afficherAvecTexte(backgroundColor + 50, "SCORE : " + str(score), police, color(255));
              
              switch(level) {

                // Facile ?
                case 1:
                  boutonPlay3.initialiserRectangle(boutonPlay2.x, boutonPlay2.y, (int)(width / 2 - videos[question.id].time() * width / 2 / 20), boutonPlay2.hauteur);
                  break;

                // Intermédiaire ?
                case 2:
                  boutonPlay3.initialiserRectangle(boutonPlay2.x, boutonPlay2.y, (int)(width / 2 - videos[question.id].time() * width / 2 / 10), boutonPlay2.hauteur);
                  break;

                // Dificile ?
                case 3:
                  boutonPlay3.initialiserRectangle(boutonPlay2.x, boutonPlay2.y, (int)(width / 2 - videos[question.id].time() * width / 2 / 5), boutonPlay2.hauteur);
                  break;

              }

              boutonPlay3.afficher(backgroundColor + 50);
              
              // Time UP ?
              if (videos[question.id].time() >= 5 && level == 3 || videos[question.id].time() >= 10 && level == 2 || videos[question.id].time() >= 20 && level == 1) {
                // Stop Video
                videos[question.id].stop();

                boutonPlay2.enlever();
                boutonSon1.enlever();
                boutonSon2.enlever();
                boutonSon3.enlever();

                // Variables à jour
                question.isPlaying = false;
                question.isEnd = true;

                // Delai
                delay(750);

                // Afficher Modes Réponses
                question.afficherModesReponses();
              }
            }

            break;

          // Etat en cours : Choix du mode ?
          case 2:

            if (mouseX > boutonCarre1.x - boutonCarre1.longueur / 2 && mouseX < boutonCarre1.x + boutonCarre1.longueur / 2 && mouseY > boutonCarre1.y - boutonCarre1.hauteur / 2 && mouseY < boutonCarre1.y + boutonCarre1.hauteur / 2) {
              boutonCarre1.afficherAvecTexte(backgroundColor + 50, "DUO", police, color(255));
            } else {
              boutonCarre1.afficherAvecTexte(backgroundColor + 10, "DUO", police, color(255));
            }

            if (mouseX > boutonCarre2.x - boutonCarre2.longueur / 2 && mouseX < boutonCarre2.x + boutonCarre2.longueur / 2 && mouseY > boutonCarre2.y - boutonCarre2.hauteur / 2 && mouseY < boutonCarre2.y + boutonCarre2.hauteur / 2) {
              boutonCarre2.afficherAvecTexte(backgroundColor + 50, "CARRÉ", police, color(255));
            } else {
              boutonCarre2.afficherAvecTexte(backgroundColor + 10, "CARRÉ", police, color(255));
            }

            if (mouseX > boutonCarre3.x - boutonCarre3.longueur / 2 && mouseX < boutonCarre3.x + boutonCarre3.longueur / 2 && mouseY > boutonCarre3.y - boutonCarre3.hauteur / 2 && mouseY < boutonCarre3.y + boutonCarre3.hauteur / 2) {
              boutonCarre3.afficherAvecTexte(backgroundColor + 50, "CASH", police, color(255));
            } else {
              boutonCarre3.afficherAvecTexte(backgroundColor + 10, "CASH", police, color(255));
            }

            if (mouseX > boutonCarre4.x - boutonCarre4.longueur / 2 && mouseX < boutonCarre4.x + boutonCarre4.longueur / 2 && mouseY > boutonCarre4.y - boutonCarre4.hauteur / 2 && mouseY < boutonCarre4.y + boutonCarre4.hauteur / 2) {
              boutonCarre4.afficherAvecTexte(backgroundColor + 50, "CRAZY", police, color(255));
            } else {
              boutonCarre4.afficherAvecTexte(backgroundColor + 10, "CRAZY", police, color(255));
            }

            break;

          // Etat en cours : Propositions ?
          case 3:

            switch(question.mode) {

              // Mode : Duo ?
              case 1:

                if (mouseX > boutonDuo1.x - boutonDuo1.longueur / 2 && mouseX < boutonDuo1.x + boutonDuo1.longueur / 2 && mouseY > boutonDuo1.y - boutonDuo1.hauteur / 2 && mouseY < boutonDuo1.y + boutonDuo1.hauteur / 2) {
                  boutonDuo1.afficherAvecTexte(backgroundColor + 50, question.propositionTab[0], police, color(255));
                } else {
                  boutonDuo1.afficherAvecTexte(backgroundColor + 10, question.propositionTab[0], police, color(255));
                }

                if (mouseX > boutonDuo2.x - boutonDuo2.longueur / 2 && mouseX < boutonDuo2.x + boutonDuo2.longueur / 2 && mouseY > boutonDuo2.y - boutonDuo2.hauteur / 2 && mouseY < boutonDuo2.y + boutonDuo2.hauteur / 2) {
                  boutonDuo2.afficherAvecTexte(backgroundColor + 50, question.propositionTab[1], police, color(255));
                } else {
                  boutonDuo2.afficherAvecTexte(backgroundColor + 10, question.propositionTab[1], police, color(255));
                }

                break;

              // Mode : Carré ?
              case 2:

                if (mouseX > boutonCarre1.x - boutonCarre1.longueur / 2 && mouseX < boutonCarre1.x + boutonCarre1.longueur / 2 && mouseY > boutonCarre1.y - boutonCarre1.hauteur / 2 && mouseY < boutonCarre1.y + boutonCarre1.hauteur / 2) {
                  boutonCarre1.afficherAvecTexte(backgroundColor + 50, question.propositionTab[0], police, color(255));
                } else {
                  boutonCarre1.afficherAvecTexte(backgroundColor + 10, question.propositionTab[0], police, color(255));
                }

                if (mouseX > boutonCarre2.x - boutonCarre2.longueur / 2 && mouseX < boutonCarre2.x + boutonCarre2.longueur / 2 && mouseY > boutonCarre2.y - boutonCarre2.hauteur / 2 && mouseY < boutonCarre2.y + boutonCarre2.hauteur / 2) {
                  boutonCarre2.afficherAvecTexte(backgroundColor + 50, question.propositionTab[1], police, color(255));
                } else {
                  boutonCarre2.afficherAvecTexte(backgroundColor + 10, question.propositionTab[1], police, color(255));
                }

                if (mouseX > boutonCarre3.x - boutonCarre3.longueur / 2 && mouseX < boutonCarre3.x + boutonCarre3.longueur / 2 && mouseY > boutonCarre3.y - boutonCarre3.hauteur / 2 && mouseY < boutonCarre3.y + boutonCarre3.hauteur / 2) {
                  boutonCarre3.afficherAvecTexte(backgroundColor + 50, question.propositionTab[2], police, color(255));
                } else {
                  boutonCarre3.afficherAvecTexte(backgroundColor + 10, question.propositionTab[2], police, color(255));
                }

                if (mouseX > boutonCarre4.x - boutonCarre4.longueur / 2 && mouseX < boutonCarre4.x + boutonCarre4.longueur / 2 && mouseY > boutonCarre4.y - boutonCarre4.hauteur / 2 && mouseY < boutonCarre4.y + boutonCarre4.hauteur / 2) {
                  boutonCarre4.afficherAvecTexte(backgroundColor + 50, question.propositionTab[3], police, color(255));
                } else {
                  boutonCarre4.afficherAvecTexte(backgroundColor + 10, question.propositionTab[03], police, color(255));
                }

                break;

              // Mode : Cash/Crazy ?
              default:

                if (mouseX > boutonCash1.x - boutonCash1.longueur / 2 && mouseX < boutonCash1.x + boutonCash1.longueur / 2 && mouseY > boutonCash1.y - boutonCash1.hauteur / 2 && mouseY < boutonCash1.y + boutonCash1.hauteur / 2) {
                  cursor(TEXT);
                } else {
                  cursor(ARROW);
                }

                if (question.isPlaying) {
                  boutonCash1.afficherAvecTexte(backgroundColor + 10, question.propositionTab[0], police, color(255));

                  strokeWeight(2);
                  stroke(255);

                  line(boutonCash1.x + textWidth(question.propositionTab[0]) / 2, boutonCash1.y - boutonCash1.hauteur / 5, boutonCash1.x + textWidth(question.propositionTab[0]) / 2, boutonCash1.y + boutonCash1.hauteur / 5);
                  
                  strokeWeight(strokeTaille);
                  stroke(0);
                }

                if (question.propositionTab[0].length() >= minChars) {
                  if (dist(mouseX, mouseY, boutonCash2.x, boutonCash2.y) < boutonCash2.rayon) {
                    boutonCash2.afficher(backgroundColor + 50);
                  } else {
                    boutonCash2.afficher(backgroundColor + 10);
                  }

                  line(boutonCash2.x - height / 150, boutonCash2.y + height / 50, boutonCash2.x - height / 50 - height / 150, boutonCash2.y);
                  line(boutonCash2.x - height / 150, boutonCash2.y + height / 50, boutonCash2.x + 2 * height / 110 + height / 90 - height / 150, boutonCash2.y - height / 100);
                } else {
                  boutonCash2.enlever();
                }

                break;

            }

            break;
      
        }

        break;

      // Question en cours : Geographie ?
      case 1:


        
        break;


      // Question en cours : Histoire ?
      case 0:

        if(question.etat == 2){
          if(MBD()){
                    Bouton R4 = new Bouton();
                    R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 10 + 25, width / 3, height / 10);
                    R4.afficherAvecTexte(histoire.background+80, "Crazy", police, color(255));
            }
            else{
                    Bouton R4 = new Bouton();
                    R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 10 + 25, width / 3, height / 10);
                    R4.afficherAvecTexte(histoire.background+50, "Crazy", police, color(255));
            }
            
            if(MBG()){
                    Bouton R3 = new Bouton();
                    R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 10 + 25, width / 3, height / 10);
                    R3.afficherAvecTexte(histoire.background+80, "Cash", police, color(255));
            }
            else{
                    Bouton R3 = new Bouton();
                    R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 10 + 25, width / 3, height / 10);
                    R3.afficherAvecTexte(histoire.background+50, "Cash", police, color(255));
            }
            
            if(MHD()){
                    Bouton R2 = new Bouton();
                    R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10, width / 3, height / 10);
                    R2.afficherAvecTexte(histoire.background+80, "Carré", police, color(255));
            }
            else{
                    Bouton R2 = new Bouton();
                    R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10, width / 3, height / 10);
                    R2.afficherAvecTexte(histoire.background+50, "Carré", police, color(255));
            }
            
            if(MHG()){
                    Bouton R1 = new Bouton();
                    R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10, width / 3, height / 10);
                    R1.afficherAvecTexte(histoire.background+80, "Duo", police, color(255));
            }
            else{
                    Bouton R1 = new Bouton();
                    R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10, width / 3, height / 10);
                    R1.afficherAvecTexte(histoire.background+50, "Duo", police, color(255));
            }
            
          }

          if(question.etat == 3){

            if(question.mode == 1) {
              
              if(BD()){
                Bouton APRES = new Bouton();
                APRES.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                APRES.afficherAvecTexte(histoire.background+80, "APRES", police, color(255));
              }
              else{
                Bouton APRES = new Bouton();
                APRES.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                APRES.afficherAvecTexte(histoire.background+50, "APRES", police, color(255));
              }
              
              if(BG()){
                Bouton AVANT = new Bouton();
                AVANT.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                AVANT.afficherAvecTexte(histoire.background+80, "AVANT", police, color(255));
              }
              else{
                Bouton AVANT = new Bouton();
                AVANT.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                AVANT.afficherAvecTexte(histoire.background+50, "AVANT", police, color(255));
              }
              
            }
            
            if(question.mode == 2){
              
              if(BD()){
                      Bouton R4 = new Bouton();
                      R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                      R4.afficherAvecTexte(histoire.background+80, String.valueOf(propositionsTab[2]), police, color(255));
              }
              else{
                      Bouton R4 = new Bouton();
                      R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                      R4.afficherAvecTexte(histoire.background+50, String.valueOf(propositionsTab[2]), police, color(255));
              }
              
              if(BG()){
                      Bouton R3 = new Bouton();
                      R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                      R3.afficherAvecTexte(histoire.background+80, String.valueOf(propositionsTab[3]), police, color(255));
              }
              else{
                      Bouton R3 = new Bouton();
                      R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                      R3.afficherAvecTexte(histoire.background+50, String.valueOf(propositionsTab[3]), police, color(255));
              }
              
              if(HD()){
                      Bouton R2 = new Bouton();
                      R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                      R2.afficherAvecTexte(histoire.background+80, String.valueOf(propositionsTab[1]), police, color(255));
              }
              else{
                      Bouton R2 = new Bouton();
                      R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                      R2.afficherAvecTexte(histoire.background+50, String.valueOf(propositionsTab[1]), police, color(255));
              }
              
              if(HG()){
                      Bouton R1 = new Bouton();
                      R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                      R1.afficherAvecTexte(histoire.background+80, String.valueOf(propositionsTab[0]), police, color(255));
              }
              else{
                      Bouton R1 = new Bouton();
                      R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                      R1.afficherAvecTexte(histoire.background+50, String.valueOf(propositionsTab[0]), police, color(255));
              }
              
            }
            
            if(question.mode == 3){
              
              if(MI()){
                      Bouton REPONSE = new Bouton();
                      REPONSE.initialiserRectangle(width / 2, height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 8);
                      REPONSE.afficherAvecTexte(histoire.background+80, "Votre réponse...", police, color(255));
              }
              else{
                      Bouton REPONSE = new Bouton();
                      REPONSE.initialiserRectangle(width / 2, height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 8);
                      REPONSE.afficherAvecTexte(histoire.background+50, "Votre réponse...", police, color(255));
              }
            }
              
            if(question.mode == 4){
              
              if(FRISE()){
                      stroke(0);
                      date = int(propositionsTab[0] + (mouseX / (width/1.5)) * 100 - 25);
                      Bouton FRISE = new Bouton();
                      FRISE.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 4 + height / 12 + 15, int(width / 1.5), height / 10);
                      FRISE.afficherAvecTexte(histoire.background+50, String.valueOf(date), police, color(255));
                      
                      stroke(255);
                      strokeWeight(3);
                      line(mouseX, height / 3 + police + 10 + height / 4 + height / 12 + 15 - height / 20 + 2, mouseX, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 20 - 2);
              }
            }
          }
          stroke(0);
          boutonScore1.afficherAvecTexte(backgroundColor + 50, "SCORE : " + str(score), police, color(255));

        break;

    }
  }
}


void mousePressed() {
  if (reset) {
    if (mouseX>370 && mouseX<550 && mouseY>358 && mouseY<450) {
      reset=false;
      PSEUDO="";
      cpt = 0;
      DIFF="";
      pret = false;
      score=0;
      scoreFinal.enlever();
      fin.enlever();
      background(backgroundColor);
      nbQuestionsRestantes=10;
      premiereQuestion=true;
      LOBBY = true;
      LANCE = false;
      JEU = false;
      CLEAR = false;
      FIRSTTIME = true;
      // INIT THEMES
      for (int i=0; i<3; i++) {
        themes[i] = false;
      }
      Menu.loop();
    }
  }

  if (LOBBY) {
    
    if(inJouer()){
      background(backgroundColor);
      LOBBY = false;
      delay(200);
      LANCE = true;
    }
    
    if(inParametre()){
      PApplet.runSketch(platformNames, new Parametres());
    }
  }
  
  else if (LANCE) {

    if(inNom()) {
      ecriture = true;
    } else {
      ecriture = false;
    }
    
    if(inDifficulte()){
      PApplet.runSketch(platformNames, new Difficultes());
    }
    
    if(inT1()){
      if(themes[0] == false){
        Bouton T1 = new Bouton();
        T1.initialiserRectangle(width / 4 - 50, height / 2 + height / 20 + 125, width / 4, height / 8);
        T1.afficherAvecTexte(backgroundColor+100, "HISTOIRE", police, color(255));
        themes[0] = true;
      }
      else{
        Bouton T1 = new Bouton();
        T1.initialiserRectangle(width / 4 - 50, height / 2 + height / 20 + 125, width / 4, height / 8);
        T1.afficherAvecTexte(backgroundColor+50, "HISTOIRE", police, color(255));
        themes[0] = false;
      }
    }
    
    if(inT2()){
      if(themes[1] == false){
        Bouton T2 = new Bouton();
        T2.initialiserRectangle(width / 2, height / 2 + height / 20 + 125, width / 4, height / 8);
        T2.afficherAvecTexte(backgroundColor+100, "GEOGRAPHIE", police, color(255));
        themes[1] = true;
      }
      else{
        Bouton T2 = new Bouton();
        T2.initialiserRectangle(width / 2, height / 2 + height / 20 + 125, width / 4, height / 8);
        T2.afficherAvecTexte(backgroundColor+50, "GEOGRAPHIE", police, color(255));
        themes[1] = false;
      }
    }
    
    if(inT3()){
      if(themes[2] == false){
        Bouton T3 = new Bouton();
        T3.initialiserRectangle(width - width / 4 + 50, height / 2 + height / 20 + 125, width / 4, height / 8);
        T3.afficherAvecTexte(backgroundColor+100, "ANIME", police, color(255));
        themes[2] = true;
      }
      else{
        Bouton T3 = new Bouton();
        T3.initialiserRectangle(width - width / 4 + 50, height / 2 + height / 20 + 125, width / 4, height / 8);
        T3.afficherAvecTexte(backgroundColor+50, "ANIME", police, color(255));
        themes[2] = false;
      }
    }
    
    if(inValide()){
      if(pret){
        PApplet.runSketch(platformNames, new Chargement());
        LANCE = false;
        background(backgroundColor);
        surface.setVisible(false);
      }
    }
  }

  else if (JEU) {

    switch(question.theme) {

      // Question en cours : BlindTest ?
      case 2:
        
        switch(question.etat) {

          // Etat en cours : Question ?
          case 1:

            if (dist(mouseX, mouseY, boutonSon2.x, boutonSon2.y) < boutonSon2.rayon) {
              clique = true;
            } else {
              clique = false;
            }

            // Bouton 'Play' jamais été pressé ?
            if (!question.isPlaying && !question.isEnd) {
              // Bouton 'Play' survolé ?
              if (dist(mouseX, mouseY, boutonPlay1.x, boutonPlay1.y) < boutonPlay1.rayon) {
                // Changer l'etat en 'Lecture'
                question.isPlaying = true;

                // Lancer la video
                videos[question.id].play();

                videos[question.id].volume(sonVideo);

                boutonPlay2.afficher(backgroundColor + 10);
              }
            }

            break;

          // Etat en cours : Choix du mode ?
          case 2:

            if (mouseX > boutonCarre1.x - boutonCarre1.longueur / 2 && mouseX < boutonCarre1.x + boutonCarre1.longueur / 2 && mouseY > boutonCarre1.y - boutonCarre1.hauteur / 2 && mouseY < boutonCarre1.y + boutonCarre1.hauteur / 2) {
              // Changement Variables
              question.mode = 1;
            }

            else if (mouseX > boutonCarre2.x - boutonCarre2.longueur / 2 && mouseX < boutonCarre2.x + boutonCarre2.longueur / 2 && mouseY > boutonCarre2.y - boutonCarre2.hauteur / 2 && mouseY < boutonCarre2.y + boutonCarre2.hauteur / 2) {
              // Changement Variables
              question.mode = 2;
            }

            else if (mouseX > boutonCarre3.x - boutonCarre3.longueur / 2 && mouseX < boutonCarre3.x + boutonCarre3.longueur / 2 && mouseY > boutonCarre3.y - boutonCarre3.hauteur / 2 && mouseY < boutonCarre3.y + boutonCarre3.hauteur / 2) {
              // Changement Variables
              question.mode = 3;
            }

            else if (mouseX > boutonCarre4.x - boutonCarre4.longueur / 2 && mouseX < boutonCarre4.x + boutonCarre4.longueur / 2 && mouseY > boutonCarre4.y - boutonCarre4.hauteur / 2 && mouseY < boutonCarre4.y + boutonCarre4.hauteur / 2) {
              // Changement Variables
              question.mode = 4;
            }

            if (question.mode != 0) {
              // Reset Espace
              boutonCarre1.enlever();
              boutonCarre2.enlever();
              boutonCarre3.enlever();
              boutonCarre4.enlever();

              // Affichage Propositions
              question.afficherPropositions();
            }

            break;

          // Etat en cours = Propositions ?
          case 3:

            switch(question.mode) {

              // Mode : Duo ?
              case 1:

                if (mouseX > boutonDuo1.x - boutonDuo1.longueur / 2 && mouseX < boutonDuo1.x + boutonDuo1.longueur / 2 && mouseY > boutonDuo1.y - boutonDuo1.hauteur / 2 && mouseY < boutonDuo1.y + boutonDuo1.hauteur / 2) {
                  String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");

                  if (questionData[3].equals(question.propositionTab[0])) {
                    boutonDuo1.afficherAvecTexte(color(90, 225, 150), question.propositionTab[0], police, color(255));
                    augmenterScore();
                  } else {
                    boutonDuo1.afficherAvecTexte(color(255, 78, 78), question.propositionTab[0], police, color(255));
                    colorierBonneReponse();
                  }

                  question.etat = 0;
                  chargerProchaineQuestion = true;
                  debutPause = millis();
                } 
                
                else if (mouseX > boutonDuo2.x - boutonDuo2.longueur / 2 && mouseX < boutonDuo2.x + boutonDuo2.longueur / 2 && mouseY > boutonDuo2.y - boutonDuo2.hauteur / 2 && mouseY < boutonDuo2.y + boutonDuo2.hauteur / 2) {
                  String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");

                  if (questionData[3].equals(question.propositionTab[1])) {
                    boutonDuo2.afficherAvecTexte(color(90, 225, 150), question.propositionTab[1], police, color(255));
                    augmenterScore();
                  } else {
                    boutonDuo2.afficherAvecTexte(color(255, 78, 78), question.propositionTab[1], police, color(255));
                    colorierBonneReponse();
                  }

                  question.etat = 0;
                  chargerProchaineQuestion = true;
                  debutPause = millis();
                }

                break;

              // Mode : Carré ?
              case 2:

                if (mouseX > boutonCarre1.x - boutonCarre1.longueur / 2 && mouseX < boutonCarre1.x + boutonCarre1.longueur / 2 && mouseY > boutonCarre1.y - boutonCarre1.hauteur / 2 && mouseY < boutonCarre1.y + boutonCarre1.hauteur / 2) {
                  String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");

                  if (questionData[3].equals(question.propositionTab[0])) {
                    boutonCarre1.afficherAvecTexte(color(90, 225, 150), question.propositionTab[0], police, color(255));
                    augmenterScore();
                  } else {
                    boutonCarre1.afficherAvecTexte(color(255, 78, 78), question.propositionTab[0], police, color(255));
                    colorierBonneReponse();
                  }

                  question.etat = 0;
                  chargerProchaineQuestion = true;
                  debutPause = millis();
                }

                else if (mouseX > boutonCarre2.x - boutonCarre2.longueur / 2 && mouseX < boutonCarre2.x + boutonCarre2.longueur / 2 && mouseY > boutonCarre2.y - boutonCarre2.hauteur / 2 && mouseY < boutonCarre2.y + boutonCarre2.hauteur / 2) {
                  String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");

                  if (questionData[3].equals(question.propositionTab[1])) {
                    boutonCarre2.afficherAvecTexte(color(90, 225, 150), question.propositionTab[1], police, color(255));
                    augmenterScore();
                  } else {
                    boutonCarre2.afficherAvecTexte(color(255, 78, 78), question.propositionTab[1], police, color(255));
                    colorierBonneReponse();
                  }

                  question.etat = 0;
                  chargerProchaineQuestion = true;
                  debutPause = millis();
                }

                else if (mouseX > boutonCarre3.x - boutonCarre3.longueur / 2 && mouseX < boutonCarre3.x + boutonCarre3.longueur / 2 && mouseY > boutonCarre3.y - boutonCarre3.hauteur / 2 && mouseY < boutonCarre3.y + boutonCarre3.hauteur / 2) {
                  String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");

                  if (questionData[3].equals(question.propositionTab[2])) {
                    boutonCarre3.afficherAvecTexte(color(90, 225, 150), question.propositionTab[2], police, color(255));
                    augmenterScore();
                  } else {
                    boutonCarre3.afficherAvecTexte(color(255, 78, 78), question.propositionTab[2], police, color(255));
                    colorierBonneReponse();
                  }

                  question.etat = 0;
                  chargerProchaineQuestion = true;
                  debutPause = millis();
                }

                else if (mouseX > boutonCarre4.x - boutonCarre4.longueur / 2 && mouseX < boutonCarre4.x + boutonCarre4.longueur / 2 && mouseY > boutonCarre4.y - boutonCarre4.hauteur / 2 && mouseY < boutonCarre4.y + boutonCarre4.hauteur / 2) {
                  String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");

                  if (questionData[3].equals(question.propositionTab[3])) {
                    boutonCarre4.afficherAvecTexte(color(90, 225, 150), question.propositionTab[3], police, color(255));
                    augmenterScore();
                  } else {
                    boutonCarre4.afficherAvecTexte(color(255, 78, 78), question.propositionTab[3], police, color(255));
                    colorierBonneReponse();
                  }

                  question.etat = 0;
                  chargerProchaineQuestion = true;
                  debutPause = millis();
                }

                break;

              // Mode : Cash/Crazy ?
              default:

                if (mouseX > boutonCash1.x - boutonCash1.longueur / 2 && mouseX < boutonCash1.x + boutonCash1.longueur / 2 && mouseY > boutonCash1.y - boutonCash1.hauteur / 2 && mouseY < boutonCash1.y + boutonCash1.hauteur / 2) {
                  question.isPlaying = true;
                } else {
                  question.isPlaying = false;

                  if (question.propositionTab[0].length() == 0) {
                    if (question.mode == 3) {
                      boutonCash1.afficherAvecTexte(backgroundColor + 10, "NOM DE L'ANIMÉ (ANGLAIS)...", police, color(255, 50));
                    } else {
                      boutonCash1.afficherAvecTexte(backgroundColor + 10, "NOM DE L'ANIMÉ (JAPONAIS)...", police, color(255, 50));
                    }
                  } else {
                    boutonCash1.afficherAvecTexte(backgroundColor + 10, question.propositionTab[0], police, color(255));
                  }
                }

                if (dist(mouseX, mouseY, boutonCash2.x, boutonCash2.y) < boutonCash2.rayon && question.propositionTab[0].length() >= minChars) {
                  String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");

                  if (question.mode == 3) {
                    if (questionData[3].equals(question.propositionTab[0].toUpperCase())) {
                      boutonCash1.afficherAvecTexte(color(90, 225, 150), question.propositionTab[0], police, color(255));
                      augmenterScore();
                    } else {
                      boutonCash1.afficherAvecTexte(color(255, 78, 78), question.propositionTab[0], police, color(255));
                    }
                  } else {
                    if (questionData[4].equals(question.propositionTab[0].toUpperCase())) {
                      boutonCash1.afficherAvecTexte(color(90, 225, 150), question.propositionTab[0], police, color(255));
                      augmenterScore();
                    } else {
                      boutonCash1.afficherAvecTexte(color(255, 78, 78), question.propositionTab[0], police, color(255));
                    }
                  }

                  boutonCash2.enlever();

                  question.etat = 0;
                  chargerProchaineQuestion = true;
                  debutPause = millis();
                }

                break;

            }

            break;
      
        }

        break;

      // Question en cours : Geographie ?
      case 1:

        if (question.etat==3 && (question.mode==1 || question.mode==2)) {
          boolean dansProposition=false;
          for (int i=0; i<reponseActuelleGeographie.length; i++) {
            if (geographie.PointInPolygon(mouseX-positionX, mouseY-positionY, departement[reponseActuelleGeographie[i]])) {
              dansProposition=true;
            }
          }
          if (dansProposition) {
            geographie.laReponse(question.id, question.mode);
            question.etat = 0;
            chargerProchaineQuestion = true;
            debutPause = millis();
          } else {
            println("Clickez sur les propositions svp");
          }
        }
        if (question.etat==3 && question.mode>2) {
          boolean dansgeographie=false;
          for (int i=0; i<95; i++) {
            if (geographie.PointInPolygon(mouseX-positionX, mouseY-positionY, departement[i])) {
              dansgeographie=true;
            }
          }
          if (dansgeographie) {
            geographie.laReponse(question.id, question.mode);
            question.etat = 0;
            chargerProchaineQuestion = true;
            debutPause = millis();
          } else {
            println("Clickez sur les propositions svp");
          }
        }

        if (question.etat == 2) {
          if (mouseX > 230 && mouseX < 480 && mouseY < 320 && mouseY > 180) {
            question.mode = 1;
            geographie.modeChoisis();
            question.afficherPropositions();
          }
          //crazy
          if (mouseX > 530 && mouseX < 780 && mouseY < 330 && mouseY > 180) {
            question.mode = 4;
            geographie.modeChoisis();
            question.afficherPropositions();
          }
          //cash
          if (mouseX > 230 && mouseX < 480 && mouseY < 520 && mouseY > 380) {
            question.mode = 3;
            geographie.modeChoisis();
            question.afficherPropositions();
          }
          //carre
          if (mouseX > 530 && mouseX < 780 && mouseY < 520 && mouseY > 380) {
            question.mode = 2;
            geographie.modeChoisis();
            question.afficherPropositions();
          }
        }

        break;

      // Question en cours : Histoire ?
      case 0:

        if(question.etat == 2){
              
          if(MBD()){
            background(backgroundColor);
            delay(500);
            question.mode = 4;
            question.afficherQuestion();
            question.afficherPropositions();
            question.etat = 3;
            }
            
          if(MBG()){
            background(backgroundColor);
            delay(500);
            question.mode = 3;
            question.afficherQuestion();
            question.afficherPropositions();
            question.etat = 3;
          }
          
          if(MHD()){
            background(backgroundColor);
            delay(500);
            question.mode = 2;
            question.afficherQuestion();
            question.afficherPropositions();
            question.etat = 3;
            }
            
          if(MHG()){
            background(backgroundColor);
            delay(500);
            question.mode = 1;
            question.afficherQuestion();
            question.afficherPropositions();
            question.etat = 3;
          }
        }

        // ETAT PROPOSITIONS
        if(question.etat == 3){
          // MODE 1
          if(question.mode == 1){
            
            if(BD()){
                
                if(propositionsTab[0] <= propositionsTab[4]){
                    Bouton APRES = new Bouton();
                    APRES.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                    APRES.afficherAvecTexte(color(0,200,0), "APRES", police, color(255));
                    BR = true;
                }
                else {
                    Bouton APRES = new Bouton();
                    APRES.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                    APRES.afficherAvecTexte(color(200,0,0), "APRES", police, color(255));
                }
                
                // MAJ ETAT
                question.etat = 0;
                chargerProchaineQuestion = true;
                debutPause = millis();

              }
            if(BG()){
              
                if(propositionsTab[0] >= propositionsTab[4]){
                    Bouton AVANT = new Bouton();
                    AVANT.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                    AVANT.afficherAvecTexte(color(0,200,0), "AVANT", police, color(255));
                    BR = true;
                }
                else {
                    Bouton AVANT = new Bouton();
                    AVANT.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                    AVANT.afficherAvecTexte(color(200,0,0), "AVANT", police, color(255));
                }
                
                // MAJ ETAT
                question.etat = 0;
                chargerProchaineQuestion = true;
                debutPause = millis();
              }
          }
          
          if(question.mode == 2){
            
            if(BD()){
                
                if(propositionsTab[2] == propositionsTab[4]){
                    Bouton R4 = new Bouton();
                    R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                    R4.afficherAvecTexte(color(0,200,0), String.valueOf(propositionsTab[2]), police, color(255));
                    BR = true;
                }
                else {
                    Bouton R4 = new Bouton();
                    R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                    R4.afficherAvecTexte(color(200,0,0), String.valueOf(propositionsTab[2]), police, color(255));
                }
                
                // MAJ ETAT
                question.etat = 0;
                chargerProchaineQuestion = true;
                debutPause = millis();

              }
            if(BG()){
              
                if(propositionsTab[3] == propositionsTab[4]){
                    Bouton R3 = new Bouton();
                    R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                    R3.afficherAvecTexte(color(0,200,0), String.valueOf(propositionsTab[3]), police, color(255));
                    BR = true;
                }
                else {
                    Bouton R3 = new Bouton();
                    R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                    R3.afficherAvecTexte(color(200,0,0), String.valueOf(propositionsTab[3]), police, color(255));
                }
                
                question.etat = 0;
                chargerProchaineQuestion = true;
                debutPause = millis();
            }
            if(HD()){
                
                if(propositionsTab[1] == propositionsTab[4]){
                    Bouton R2 = new Bouton();
                    R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                    R2.afficherAvecTexte(color(0,200,0), String.valueOf(propositionsTab[1]), police, color(255));
                    BR = true;
                }
                else {
                    Bouton R2 = new Bouton();
                    R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                    R2.afficherAvecTexte(color(200,0,0), String.valueOf(propositionsTab[1]), police, color(255));
                }
                
                // MAJ ETAT
                question.etat = 0;
                chargerProchaineQuestion = true;
                debutPause = millis();

              }
            if(HG()){
              
                if(propositionsTab[0] == propositionsTab[4]){
                    Bouton R1 = new Bouton();
                    R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                    R1.afficherAvecTexte(color(0,200,0), String.valueOf(propositionsTab[0]), police, color(255));
                    BR = true;
                }
                else {
                    Bouton R1 = new Bouton();
                    R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                    R1.afficherAvecTexte(color(200,0,0), String.valueOf(propositionsTab[0]), police, color(255));
                }
                question.etat = 0;
                chargerProchaineQuestion = true;
                debutPause = millis();
            }

            if(question.etat == 0) {

              if(propositionsTab[0] == propositionsTab[4]){
                      Bouton R1 = new Bouton();
                      R1.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                      R1.afficherAvecTexte(color(0,200,0), String.valueOf(propositionsTab[0]), police, color(255));
              }
              else if(propositionsTab[1] == propositionsTab[4]){
                      Bouton R2 = new Bouton();
                      R2.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15, width / 3, height / 10);
                      R2.afficherAvecTexte(color(0,200,0), String.valueOf(propositionsTab[1]), police, color(255));
              }
              else if(propositionsTab[2] == propositionsTab[4]){
                      Bouton R4 = new Bouton();
                      R4.initialiserRectangle(width - width / 4 - 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                      R4.afficherAvecTexte(color(0,200,0), String.valueOf(propositionsTab[2]), police, color(255));
              }
              else{
                      Bouton R3 = new Bouton();
                      R3.initialiserRectangle(width / 4 + 50, height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 10);
                      R3.afficherAvecTexte(color(0,200,0), String.valueOf(propositionsTab[3]), police, color(255));
              }

            }
          
              
              
          }
          if(question.mode == 3){
            if(MI()){
              int rep = Clavier.lireEntier();
              if(level == 1){
                if(abs(rep - propositionsTab[4]) <= 20){
                      Bouton REPONSE = new Bouton();
                      REPONSE.initialiserRectangle(width / 2, height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 8);
                      REPONSE.afficherAvecTexte(color(0,200,0), String.valueOf(rep), police, color(255));
                      BR = true;
                      
                      fill(0,200,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-80);
                }
                else {
                      Bouton REPONSE = new Bouton();
                      REPONSE.initialiserRectangle(width / 2, height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 8);
                      REPONSE.afficherAvecTexte(color(200,0,0), String.valueOf(rep), police, color(255));
                      
                      fill(200,0,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-80);
                }
              }
              if(level == 2){
                if(abs(rep - propositionsTab[4]) <= 10){
                      Bouton REPONSE = new Bouton();
                      REPONSE.initialiserRectangle(width / 2, height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 8);
                      REPONSE.afficherAvecTexte(color(0,200,0), String.valueOf(rep), police, color(255));
                      BR = true;
                      
                      fill(0,200,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-80);
                }
                else {
                      Bouton REPONSE = new Bouton();
                      REPONSE.initialiserRectangle(width / 2, height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 8);
                      REPONSE.afficherAvecTexte(color(200,0,0), String.valueOf(rep), police, color(255));
                      
                      fill(200,0,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-80);
                }
              }
              if(level == 3){
                if(abs(rep - propositionsTab[4]) <= 2){
                      Bouton REPONSE = new Bouton();
                      REPONSE.initialiserRectangle(width / 2, height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 8);
                      REPONSE.afficherAvecTexte(color(0,200,0), String.valueOf(rep), police, color(255));
                      BR = true;
                      
                      fill(0,200,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-80);
                }
                else {
                      Bouton REPONSE = new Bouton();
                      REPONSE.initialiserRectangle(width / 2, height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25, width / 3, height / 8);
                      REPONSE.afficherAvecTexte(color(200,0,0), String.valueOf(rep), police, color(255));
                      
                      fill(200,0,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-80);
                }
              }
              question.etat = 0;
              chargerProchaineQuestion = true;
              debutPause = millis();
            }
          }
          if(question.mode == 4){
            if(FRISE()){
              if(level == 1){
                if(abs(date - propositionsTab[4]) <= 20 ){
                      Bouton FRISE = new Bouton();
                      FRISE.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 4 + height / 12 + 15, int(width / 1.5), height / 10);
                      FRISE.afficherAvecTexte(color(0,200,0), String.valueOf(date), police, color(255));
                      BR = true;
                      
                      fill(0,200,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-100);
                }
                else{
                      Bouton FRISE = new Bouton();
                      FRISE.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 4 + height / 12 + 15, int(width / 1.5), height / 10);
                      FRISE.afficherAvecTexte(color(200,0,0), String.valueOf(date), police, color(255));
                      
                      fill(200,0,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-100);
                }
              }
              if(level == 2){
                if(abs(date - propositionsTab[4]) <= 10 ){
                      Bouton FRISE = new Bouton();
                      FRISE.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 4 + height / 12 + 15, int(width / 1.5), height / 10);
                      FRISE.afficherAvecTexte(color(0,200,0), String.valueOf(date), police, color(255));
                      BR = true;
                      
                      fill(0,200,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-100);
                }
                else{
                      Bouton FRISE = new Bouton();
                      FRISE.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 4 + height / 12 + 15, int(width / 1.5), height / 10);
                      FRISE.afficherAvecTexte(color(200,0,0), String.valueOf(date), police, color(255));
                      
                      fill(200,0,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-100);
                }
              }
              if(level == 3){
                if(abs(date - propositionsTab[4]) <= 2 ){
                      Bouton FRISE = new Bouton();
                      FRISE.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 4 + height / 12 + 15, int(width / 1.5), height / 10);
                      FRISE.afficherAvecTexte(color(0,200,0), String.valueOf(date), police, color(255));
                      BR = true;
                      
                      fill(0,200,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-100);
                }
                else{
                      Bouton FRISE = new Bouton();
                      FRISE.initialiserRectangle(width / 2, height / 3 + police + 10 + height / 4 + height / 12 + 15, int(width / 1.5), height / 10);
                      FRISE.afficherAvecTexte(color(200,0,0), String.valueOf(date), police, color(255));
                      
                      fill(200,0,0);
                      text("Réponse : "+propositionsTab[4],width / 2, height-100);
                }
              }
              question.etat = 0;
              chargerProchaineQuestion = true;
              debutPause = millis();
            }
          }
        }
        if(BR){
          augmenterScore();
          BR = false;
        }

        break;
            
      }


    }

}



void keyPressed() {
  if (LANCE && ecriture) {
    if (PSEUDO.length() <= maxChars - 20 && (keyCode >= 65 && keyCode <= 90 || keyCode == 32 || keyCode >= 48 && keyCode <= 57)) {
      PSEUDO += key;
    }

    else if (keyCode == 8 && PSEUDO.length() != 0) {
      PSEUDO = PSEUDO.substring(0, PSEUDO.length() - 1);
    } 
  }

  if (JEU) {
    switch(question.theme) {

      // Question en cours : BlindTest ?
      case 2:

        switch(question.etat) {

          // Etat : Propositions ?
          case 3:

            switch(question.mode) {

              case 1:
                break;

              case 2:
                break;

              // Mode : Cash/Crazy ?
              default:

                if (question.isPlaying) {
                  if (question.propositionTab[0].length() <= maxChars && (keyCode >= 65 && keyCode <= 90 || keyCode == 32 || keyCode >= 48 && keyCode <= 57 || key == 46 || keyCode == 52 || keyCode == 56 || keyCode == 61)) {
                    // Touches : A -> Z | 0 -> 9 | SPACE | : | ' | ! | -
                    question.propositionTab[0] += key;
                  } 
                  
                  else if (keyCode == 8 && question.propositionTab[0].length() != 0) {
                    // Touche : SUPP
                    question.propositionTab[0] = question.propositionTab[0].substring(0, question.propositionTab[0].length() - 1);
                  } 
                  
                  else if (key == ENTER && question.propositionTab[0].length() >= minChars) {
                    // Touche : ENTER
                    cursor(ARROW);

                    String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");

                    if (question.mode == 3) {
                      if (questionData[3].equals(question.propositionTab[0].toUpperCase())) {
                        boutonCash1.afficherAvecTexte(color(90, 225, 150), question.propositionTab[0], police, color(255));
                        augmenterScore();
                      } else {
                        boutonCash1.afficherAvecTexte(color(255, 78, 78), question.propositionTab[0], police, color(255));
                      }
                    } else {
                      if (questionData[4].equals(question.propositionTab[0].toUpperCase())) {
                        boutonCash1.afficherAvecTexte(color(90, 225, 150), question.propositionTab[0], police, color(255));
                        augmenterScore();
                      } else {
                        boutonCash1.afficherAvecTexte(color(255, 78, 78), question.propositionTab[0], police, color(255));
                      }
                    }

                    boutonCash2.enlever();

                    question.etat = 0;
                    chargerProchaineQuestion = true;
                    debutPause = millis();
                  }
                }

                break;

            }

            break;

        }

        break;

    }

  }
}



void movieEvent(Movie video) {
  video.read();
}



boolean inJouer(){
  if(mouseX > width / 2 - width / 3 && mouseX < width / 2 + width / 10){
    if(mouseY > height / 3 + 50 - height / 16 && mouseY < height / 3 + 50 + height /16){
      return true;
    }
  }
  return false;
}



boolean inParametre(){
  if(mouseX > width / 2 - width / 10 && mouseX < width / 2 + width / 8){
    if(mouseY > height - 100 - height / 16 && mouseY < height - 100 + height /16){
      return true;
    }
  }
  return false;
}



boolean inNom(){
  if(mouseX > width / 2 - width / 4 && mouseX < width / 2 + width / 4){
    if(mouseY > height / 2 - 100 && mouseY < height / 2 + 2 * height / 20 - 100){
      return true;
    }
  } return false;
}



boolean inDifficulte(){
  if(mouseX > width / 2 - width / 6 && mouseX < width / 2 + width / 6){
    if(mouseY > height / 2 && mouseY < height / 2 + 2 * height / 20){
      return true;
    }
  } return false;
}



boolean inT1(){
  if(mouseX > width / 4 - 50 - width / 8 && mouseX < width / 4 - 50 + width / 8){
    if(mouseY > height / 2 + height / 20 + 125 - height / 16 && mouseY <height / 2 + height / 20 + 125 + height / 16){
      return true;
    }
  } return false;
}



boolean inT2(){
  if(mouseX > width / 2 - width / 8 && mouseX < width / 2 + width / 8){
    if(mouseY > height / 2 + height / 20 + 125 - height / 16 && mouseY < height / 2 + height / 20 + 125 + height / 16){
      return true;
    }
  } return false;
}



boolean inT3(){
  if(mouseX > width - width / 4 + 50 - width / 8 && mouseX < width - width / 4 + 50 + width / 8){
    if(mouseY > height / 2 + height / 20 + 125 - height / 16 && mouseY < height / 2 + height / 20 + 125 + height / 16){
      return true;
    }
  } return false;
}



boolean inValide(){
  if(mouseX > width / 2 - width / 10 && mouseX < width / 2 + width / 10){
    if(mouseY > height - 40 - height / 20 && mouseY < height - 40 + height / 20){
      return true;
    }
  }
  return false;
}



// DEBUT 'FENETRE PARAMETRE' //

// BOUTON PETIT
color petColor = color(backgroundColor+50);
color petLight;
int petX, petY;
int petSize = 60;
boolean petIn = false;

// BOUTON MOYEN
color moyColor = color(backgroundColor+50);
color moyLight;
int moyX, moyY;
int moySize = 60;
boolean moyIn = false;

// BOUTON GRAND
color grdColor = color(backgroundColor+50);
color grdLight;
int grdX, grdY;
int grdSize = 60;
boolean grdIn = false;

// BOUTON VALIDER
color valColor = color(0, 190, 0);
color valLight;
int valX, valY;
int valSize = 60;
boolean valIn = false;

public class Parametres extends PApplet {

  public void settings() {

    size(800, 200);
  }



  public void setup() {

    // FOND IMAGE
    background(backgroundColor);
    stroke(255);
    strokeWeight(5);
    line(width, 0, width, height);
    line(width, height, 0, height);
    line(0, height, 0, 0);
    strokeWeight(1);

    // BOUTON PETIT
    petLight = color(backgroundColor+80);
    petX = 0;
    petY = 0;
    stroke(255);
    textSize(44);
    textAlign(CENTER, BOTTOM);

    // BOUTON MOYEN
    moyLight = color(backgroundColor+80);
    moyX = 0;
    moyY = 0;
    stroke(255);
    textSize(44);
    textAlign(CENTER, BOTTOM);

    // BOUTON GRAND
    grdLight = color(backgroundColor+80);
    grdX = 0;
    grdY = 0;
    stroke(255);
    textSize(44);
    textAlign(CENTER, BOTTOM);

    // BOUTON VALIDER
    valLight = color(0, 104, 0);
    valX = 0;
    valY = 0;
    stroke(255);
    textSize(44);
    textAlign(CENTER, BOTTOM);
  }



  public void draw() {
    updateParametre(mouseX, mouseY);

    // FERMER FENETRE
    if (keyCode==TAB) {
      surface.setVisible(false);
    }

    // BOUTON PETIT
    if (petIn) {
      fill(petLight);
    } else {
      fill(petColor);
    }
    stroke(255);
    rect(petX+20, petY+40, petSize*1.5, petSize);

    // BOUTON MOYEN
    if (moyIn) {
      fill(moyLight);
    } else {
      fill(moyColor);
    }
    stroke(255);
    rect(moyX+120, moyY+40, moySize*1.5, moySize);

    // BOUTON GRAND
    if (grdIn) {
      fill(grdLight);
    } else {
      fill(grdColor);
    }
    stroke(255);
    rect(grdX+220, grdY+40, grdSize*1.5, grdSize);

    // BOUTON VALIDER
    if (valIn) {
      fill(valLight);
    } else {
      fill(valColor);
    }
    stroke(255);
    rect(width-115, height-57, valSize*1.8, valSize/1.2);


    // TEXTE PETIT
    fill(255);
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("PETIT", 65, 82);

    // TEXTE MOYEN
    fill(255);
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("MOYEN", 165, 82);

    // TEXTE GRAND
    fill(255);
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("GRAND", 265, 82);

    // TEXTE VALIDER
    fill(255);
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("VALIDER", width-60, height-20);

    // TEXTE police
    fill(255);
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("TAILLE DE LA police", 165, 35);
  }



  boolean inPet(int x, int y, float width, float height) {

    // FONCTION TEST SI DANS BOUTON PETIT
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }



  boolean inMoy(int x, int y, float width, float height) {

    // FONCTION TEST SI DANS BOUTON MOYEN
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }



  boolean inGrd(int x, int y, float width, float height) {

    // FONCTION TEST SI DANS BOUTON GRAND
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }



  boolean inVal(int x, int y, float width, float height) {

    // FONCTION TEST SI DANS BOUTON VALIDER
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }



  void updateParametre(int x, int y) {

    // MAJ DE petIn
    if (inPet(petX+20, petY+40, petSize*1.5, petSize)) {
      petIn = true;
      moyIn = false;
      grdIn = false;
      valIn = false;

      // MAJ DE moyIn
    } else if (inMoy(moyX+120, moyY+40, moySize*1.5, moySize)) {
      petIn = false;
      moyIn = true;
      grdIn = false;
      valIn = false;

      //MAJ DE grdIn
    } else if (inGrd(grdX+220, grdY+40, grdSize*1.5, grdSize)) {
      petIn = false;
      moyIn = false;
      grdIn = true;
      valIn = false;

      //SORTIR DE PARAMETRES
    } else if (inVal(width-115, height-57, valSize*1.8, valSize/1.2)) {
      petIn = false;
      moyIn = false;
      grdIn = false;
      valIn = true;

      // MAJ DE TOUS
    } else {
      petIn = moyIn = grdIn = valIn =false;
    }
  }



  void mousePressed() {

    // MODIFICAION police
    if (inPet(petX+20, petY+40, petSize*1.5, petSize)) {
      police = 14;
      petColor = color(backgroundColor+150);
      moyColor = color(0);
      grdColor = color(0);
    } else if (inMoy(moyX+120, moyY+40, moySize*1.5, moySize)) {
      police = 24;
      petColor = color(0);
      moyColor = color(backgroundColor+150);
      grdColor = color(0);
    } else if (inGrd(grdX+220, grdY+40, grdSize*1.5, grdSize)) {
      police = 34;
      petColor = color(0);
      moyColor = color(0);
      grdColor = color(backgroundColor+150);
    } else if (inVal(width-115, height-57, valSize*1.8, valSize/1.2)) {
      surface.setVisible(false);
    }
  }
}

// FIN 'FENETRE PARAMETRE' //



// DEBUT 'FENETRE DIFFICULTE' //

public class Difficultes extends PApplet {

  // BOUTON FACILE
  color petColor;
  color petLight;
  int petX, petY;
  int petSize = 60;
  boolean petIn = false;

  // BOUTON MOYEN
  color moyColor;
  color moyLight;
  int moyX, moyY;
  int moySize = 60;
  boolean moyIn = false;

  // BOUTON DIFFICLE
  color grdColor;
  color grdLight;
  int grdX, grdY;
  int grdSize = 60;
  boolean grdIn = false;
  


  public void settings() {

    size(800, 200);
  }



  public void setup() {

    // FOND IMAGE
    background(backgroundColor);
    stroke(255);
    strokeWeight(5);
    line(width, 0, width, height);
    line(width, height, 0, height);
    line(0, height, 0, 0);
    strokeWeight(1);

    // BOUTON FACILE
    petLight = backgroundColor+20;
    petX = 0;
    petY = 0;
    stroke(255);
    textSize(44);
    textAlign(CENTER, BOTTOM);

    // BOUTON MOYEN
    moyLight = backgroundColor+20;
    moyX = 0;
    moyY = 0;
    stroke(255);
    textSize(44);
    textAlign(CENTER, BOTTOM);

    // BOUTON DIFFICLE
    grdLight = backgroundColor+20;
    grdX = 0;
    grdY = 0;
    stroke(255);
    textSize(44);
    textAlign(CENTER, BOTTOM);
  }



  public void draw() {
    updateDifficulte(mouseX, mouseY);

    // FERMER FENETRE
    if (keyCode==TAB) {
      surface.setVisible(false);
    }

    // BOUTON FACILE
    if (petIn) {
      fill(petLight);
    } else {
      fill(backgroundColor);
    }
    stroke(255);
    rect(petX+260, petY+40, petSize*1.5, petSize);

    // BOUTON MOYEN
    if (moyIn) {
      fill(moyLight);
    } else {
      fill(backgroundColor);
    }
    stroke(255);
    rect(moyX+360, moyY+40, moySize*1.5, moySize);

    // BOUTON DIFFICLE
    if (grdIn) {
      fill(grdLight);
    } else {
      fill(backgroundColor);
    }
    stroke(255);
    rect(grdX+460, grdY+40, grdSize*1.5, grdSize);


    // TEXTE FACILE
    fill(0, 255, 0);
    textSize(18);
    textAlign(CENTER, BOTTOM);
    text("FACILE", 305, 82);

    // TEXTE MOYEN
    fill(255, 120, 0);
    textSize(18);
    textAlign(CENTER, BOTTOM);
    text("MOYEN", 405, 82);

    // TEXTE DIFFICILE
    fill(255, 0, 0);
    textSize(18);
    textAlign(CENTER, BOTTOM);
    text("DIFFICILE", 505, 82);

    // TEXTE CHOISIR
    fill(255);
    textSize(20);
    textAlign(CENTER, BOTTOM);
    text("CHOISSIR LA DIFFICULTE DU QUIZZ", width/2, 35);
  }



  boolean inPet(int x, int y, float width, float height) {

    // FONCTION TEST SI DANS BOUTON FACILE
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }



  boolean inMoy(int x, int y, float width, float height) {

    // FONCTION TEST SI DANS BOUTON MOYEN
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }



  boolean inGrd(int x, int y, float width, float height) {

    // FONCTION TEST SI DANS BOUTON DIFFICLE
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }



  void updateDifficulte(int x, int y) {

    // MAJ DE petIn
    if (inPet(petX+260, petY+40, petSize*1.5, petSize)) {
      petIn = true;
      moyIn = false;
      grdIn = false;

      // MAJ DE moyIn
    } else if (inMoy(moyX+360, moyY+40, moySize*1.5, moySize)) {
      petIn = false;
      moyIn = true;
      grdIn = false;

      //MAJ DE grdIn
    } else if (inGrd(grdX+460, grdY+40, grdSize*1.5, grdSize)) {
      petIn = false;
      moyIn = false;
      grdIn = true;

      // MAJ DES DEUX
    } else {
      petIn = moyIn = grdIn = false;
    }
  }



  void mousePressed() {

    // MODIFICAION DIFFICULTE
    if (inPet(petX+260, petY+40, petSize*1.5, petSize)) {
      level = 1;
      DIFF = "FACILE";
      surface.setVisible(false);
    } else if (inMoy(moyX+360, moyY+40, moySize*1.5, moySize)) {
      level = 2;
      DIFF = "MOYEN";
      surface.setVisible(false);
    } else if (inGrd(grdX+460, grdY+40, grdSize*1.5, grdSize)) {
      level = 3;
      DIFF = "DIFFICILE";
      surface.setVisible(false);
    }
  }
}



void textWithPopup(char tmp[], int thisHeight){
  
  // TITRE MOUVEMENT (NE PAS TOUCHER JE VAIS PAS REUSSIR A REPARER)
  int offset = 250;
  int textsize = 64;
  textSize(textsize);
  for (char i = 0; i < tmp.length; i++){
    char thisChar = tmp[i];
    if (i == int(frameCount * 0.2) % (tmp.length + 2)){
      fill(220,120,0);
      text(thisChar, offset, thisHeight - 15);
    }else{
      fill(255);
      text(thisChar, offset, thisHeight);
    }
    offset += textsize;
  }
}

// FIN 'FENETRE DIFFICULTE' //


// DEBUT 'FENETRE CHARGEMENT' //
public class Chargement extends PApplet { 
  
  float mSecond;
  int prev_mSecond;
  int percent = 0;
  int dif = millis();
  int delais = 0;
  


  public void settings(){
    
    size(300,300);
  }
  


  public void setup(){
    
    background(backgroundColor);
    mSecond = 0;

    rect(50,130, 200, 20);
  }
  


  public void draw(){
    percent += 1;

    stroke(255);
    background(backgroundColor);
    fill(backgroundColor);
    rect(50,130, 200, 20);
    fill(255);
    
    rect(50,130, percent * 200 / 100, 20);

    textSize(18);
    text("Chargement " + percent + "%", 50, 120);

    if (percent == debutVideo && indiceVideo < nbQuestionsAnime) {
      videos[indiceVideo] = new Movie(PokyQuizz.this, "BlindTest/Videos/bt" + indiceVideo + ".mp4");

      debutVideo += 4;
      indiceVideo++;
    }
    
    if(percent == 100){
      delay(500);
      
      // -- LANCEMENT DU JEU -- \\
      percent = 1000000;
      surface.setVisible(false);
      JEU = true;
      CLEAR = true;
    }
  }
  


  void mousePressed() {
    if(mSecond >= 200)
      {
        dif = millis();
      }
  }
}

// FIN 'FENETRE CHARGEMENT' //



void augmenterScore() {
  stroke(0);
  score += level * question.mode;
  boutonScore1.afficherAvecTexte(backgroundColor + 50, "SCORE : " + str(score), police, color(255));
}



void colorierBonneReponse() {
  String[] questionData = loadStrings("BlindTest/Questions/bt" + question.id + ".txt");

  switch(question.mode) {
    case 1:
      for(int i = 0 ; i < question.propositionTab.length ; i++) {
        if (questionData[3].equals(question.propositionTab[i].toUpperCase())) {
          switch(i) {
            case 0:
              boutonDuo1.afficherAvecTexte(color(90, 225, 150), question.propositionTab[0], police, color(255));
              break;
            case 1:
              boutonDuo2.afficherAvecTexte(color(90, 225, 150), question.propositionTab[1], police, color(255));
              break;
          }
        }
      }
      break;

    case 2:
      for(int i = 0 ; i < question.propositionTab.length ; i++) {
        if (questionData[3].equals(question.propositionTab[i].toUpperCase())) {
          switch(i) {
            case 0:
              boutonCarre1.afficherAvecTexte(color(90, 225, 150), question.propositionTab[0], police, color(255));
              break;
            case 1:
              boutonCarre2.afficherAvecTexte(color(90, 225, 150), question.propositionTab[1], police, color(255));
              break;
            case 2:
              boutonCarre3.afficherAvecTexte(color(90, 225, 150), question.propositionTab[2], police, color(255));
              break;
            case 3:
              boutonCarre4.afficherAvecTexte(color(90, 225, 150), question.propositionTab[3], police, color(255));
              break;
          }
        }
      }
      break;
  }
}



void jouer() {
  int questionTheme;
  int questionId = 0;

  boolean end;

  if (premiereQuestion) {
    premiereQuestion = false;

    questionsHistoire = new int[nbQuestionsRestantes];
    questionsGeographie = new int[nbQuestionsRestantes];
    questionsAnime = new int[nbQuestionsRestantes];

    for (int a = 0 ; a < questionsHistoire.length ; a++) {
      questionsHistoire[a] = -1;
    }

    for (int a = 0 ; a < questionsGeographie.length ; a++) {
      questionsGeographie[a] = -1;
    }

    for (int a = 0 ; a < questionsAnime.length ; a++) {
      questionsAnime[a] = -1;
    }
  }
  
  do {
    questionTheme = (int)random(themes.length);
  } while (themes[questionTheme] != true);

  switch(questionTheme) {

    // Histoire ?
    case 0:
      do {
        questionId = (int)random(nbQuestionsHistoire);
        end = true;
        for (int i = 0 ; i < questionsHistoire.length ; i++) {
          if (questionId == questionsHistoire[i]) {
            end = false;
          }
        }
      } while (!end);

      for (int j = 0 ; j < questionsHistoire.length ; j++) {
        if (questionsHistoire[j] == -1) {
          questionsHistoire[j] = questionId;
          break;
        }
      }
      break;

    // Geographie ?
    case 1:
      do {
        questionId = (int)random(nbQuestionsGeographie);
        end = true;
        for (int i = 0 ; i < questionsGeographie.length ; i++) {
          if (questionId == questionsGeographie[i]) {
            end = false;
          }
        }
      } while (!end);

      for (int j = 0 ; j < questionsGeographie.length ; j++) {
        if (questionsGeographie[j] == -1) {
          questionsGeographie[j] = questionId;
          break;
        }
      }
      break;

    // Anime ?
    case 2:
      do {
        questionId = (int)random(nbQuestionsAnime);
        end = true;
        for (int i = 0 ; i < questionsAnime.length ; i++) {
          if (questionId == questionsAnime[i]) {
            end = false;
          }
        }
      } while (!end);

      for (int j = 0 ; j < questionsAnime.length ; j++) {
        if (questionsAnime[j] == -1) {
          questionsAnime[j] = questionId;
          break;
        }
      }
      break;

  }

  question = new Question();
  question.initialiserQuestion(questionTheme, questionId);
  question.afficherQuestion();

}



void questionSuivante() {
  nbQuestionsRestantes--;
  if (nbQuestionsRestantes != 0) {
    jouer();
  } else {
    ecranFin();
  }
}

boolean BG(){
    if (mouseX > width / 4 + 50 - width / 6 && mouseX < width / 4 + 50 + width / 6){
          if(mouseY > height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25 - height / 20 && mouseY < height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25 + height / 20){
            return true;
          }
  }
  return false;
}

boolean BD(){
  if(mouseX > width - width / 4 - 50 - width / 6 && mouseX < width - width / 4 - 50 + width / 6){
          if(mouseY > height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25 - height / 20 && mouseY < height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25 + height / 20){
            return true;
          }
  }
  return false;
}

boolean HG(){
    if (mouseX > width / 4 + 50 - width / 6 && mouseX < width / 4 + 50 + width / 6){
          if(mouseY > height / 3 + police + 10 + height / 4 + height / 12 + 15 - height / 20 && mouseY < height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 20){
            return true;
          }
  }
  return false;
}

boolean HD(){
  if(mouseX > width - width / 4 - 50 - width / 6 && mouseX < width - width / 4 - 50 + width / 6){
          if(mouseY > height / 3 + police + 10 + height / 4 + height / 12 + 15 - height / 20 && mouseY < height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 20){
            return true; 
          }
  }
  return false;
}

boolean MI(){
  if(mouseX > width / 2 - width / 6 && mouseX < width / 2 + width / 6){
          if(mouseY > height / 3 -75 + police + 10 + height / 4 + height / 12 + 15 + height / 10 + 25 - height / 20 && mouseY < height / 3 -75 + police+ 10 + height / 4 + height / 12 + 15 + height / 10 + 25 + height / 20){
            return true; 
          }
  }
  return false;
}

boolean FRISE(){
  if(mouseX > width / 2 - width / 3 && mouseX < width / 2 + width / 3){
          if(mouseY > height / 3 + police + 10 + height / 4 + height / 12 + 15 - height / 10 && mouseY < height / 3 + police + 10 + height / 4 + height / 12 + 15 + height / 20){
      return true;
    }
  }
  return false;
}

boolean MBG(){
    if (mouseX > width / 4 + 50 - width / 6 && mouseX < width / 4 + 50 + width / 6){
          if(mouseY > height / 3 + police + 10 + height / 10 + 25 - height / 20 && mouseY < height / 3 + police + 10 + height / 10 + 25 + height / 20){
            return true;
          }
  }
  return false;
}

boolean MBD(){
  if(mouseX > width - width / 4 - 50 - width / 6 && mouseX < width - width / 4 - 50 + width / 6){
          if(mouseY > height / 3 + police + 10 + height / 10 + 25 - height / 20 && mouseY < height / 3 + police + 10 + height / 10 + 25 + height / 20){
            return true;
          }
  }
  return false;
}

boolean MHG(){
    if (mouseX > width / 4 + 50 - width / 6 && mouseX < width / 4 + 50 + width / 6){
          if(mouseY > height / 3 + police + 10 - height / 20 && mouseY < height / 3 + police + 10 + height / 20){
            return true;
          }
  }
  return false;
}

boolean MHD(){
  if(mouseX > width - width / 4 - 50 - width / 6 && mouseX < width - width / 4 - 50 + width / 6){
          if(mouseY > height / 3 + police + 10 - height / 20 && mouseY < height / 3 + police + 10 + height / 20){
            return true; 
          }
  }
  return false;
}

void ecranFin() {
  reset=true;
  background(backgroundColor);
  stroke(color(255));
  fill(color(255));
  textSize(police+10);
  text("SCORE FINAL", 450, 50);
  textSize(police);
  if (score<10*level) {
    text("Vous avez des lacunes culturelle. Il serait temps de les combler.", 425, 300);
  }
  if (score>=10*level && score<25*level) {
    text("C'est un bon début mais vous pouvez mieux faire", 425, 300);
  }
  if (score>=25*level && score<32*level) {
    text("Bravo, vous avez une très bonne culture. ", 425, 300);
  }
  if (score>=32*level && score<40*level) {
    text("La perfection est à portée de main vous pouvez le faire !!! ", 425, 300);
  }
  if (score==40*level) {
    text("Vous êtes un dieu de la culture, ne changez rien", 425, 300);
  }

  scoreFinal.initialiserRond(500, 225, 50);
  scoreFinal.afficherAvecTexte(backgroundColor+50, str(score), police+10, color(255));

  fin.initialiserRectangle(460, 400, 180, 90);
  fin.afficherAvecTexte(backgroundColor+50, "  CONTINUER ", police, color(255));
}