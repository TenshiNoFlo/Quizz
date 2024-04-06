class Question {
  int theme; // Chiffre correspondant au thème | 0 : Histoire | 1 : Géographie | 2 : BlindTest Animés
  int id; // Chiffre correspondant à la question | De 0 à ???
  int etat; // Chiffre correspondant à son etat actuel | 0 : Aucun | 1 : Question | 2 : Choix du mode | 3 : Propositions
  int mode; // Chiffre correspondant à son mode actuel | 0 : Aucun | 1 : Duo | 2 : Carré | 3 : Cash | 4 : Crazy

  boolean isPlaying; // Sert à savoir si un fichier audio/video est en cours de lecture | True : Oui | False : Non
  boolean isEnd; // Sert à savoir si un fichier video/audio a déjà été joué une fois | True : Oui | False : Non
  
  String[] propositionTab; // Tableau contenant les propositions dans l'ordre
  
  // Fonction qui initialise les champs de l'instance
  void initialiserQuestion(int theme, int id) {
    // Besoin de les avoir
    this.theme = theme;
    this.id = id;

    // Par défaut
    this.etat = 0;
    this.mode = 0;

    this.isPlaying = false;
    this.isEnd = false;
  }
  
  // Fonction qui affiche une question en fonction de son thème & de son id
  void afficherQuestion() {
    // Basculement de l'etat
    this.etat = 1;

    switch(this.theme) {
      // BlindTest Animés ?
      case 2:
        blindtest.afficherQuestion(this.id);
        break;
      // Géographie ?
      case 1:
        geographie.afficherQuestionGeographie(this.id);
        break;
      // Histoire ?
      case 0:
        histoire.afficherQuestion(this.id);
        break;
    }
  }
  
  // Fonction qui affiche les différents modes de réponses possibles
  void afficherModesReponses() {
    // Basculement de l'etat
    this.etat = 2;

    switch(this.theme) {
      // BlindTest Animés ?
      case 2:
        blindtest.afficherModesReponses();
        break;
      // Géographie ?
      case 1:
        geographie.mode();
        break;
      // Histoire ?
      case 0:
        histoire.afficherModesReponses();
        break;
    }
  }
  
  // Fonction qui affiche les proposition en fonction du theme de la question, de son id & du choix de l'utilisateur
  void afficherPropositions() {
    // Basculement de l'etat
    this.etat = 3;

    switch(this.theme) {
      // BlindTest Animés ?
      case 2:
        blindtest.afficherPropositions(this);
        break;
      // Géographie ?
      case 1:
        geographie.afficherProposition(this.id, level, this.mode);
        break;
      // Histoire ?
      case 0:
        histoire.afficherPropositions(this.id, this.mode);
        break;
    }
  }
}