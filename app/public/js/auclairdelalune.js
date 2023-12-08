var allowedKeysAuclairdelalune = {
    97: 'do',
    98: 're',
    99: 'mi'
};

var auclairdelalune = ['do', 'do', 'do', 're', 'mi', 're', 'do', 'mi', 're', 're', 'do'];

var codePositionAuclairdelalune = 0;

document.addEventListener('keydown', function(e) {
    var keyAuclairdelalune = allowedKeysAuclairdelalune[e.keyCode];
    var requiredKeyAuclairdelalune = auclairdelalune[codePositionAuclairdelalune];

    if(keyAuclairdelalune == 'do'){
      var do_ = new Audio("./assets/do.mp3");
      do_.play();
    }
    if(keyAuclairdelalune == 're'){
      var re_ = new Audio("./assets/re.mp3");
      re_.play();
    }
    if(keyAuclairdelalune == 'mi'){
      var mi_ = new Audio("./assets/mi.mp3");
      mi_.play();
    }

    if (keyAuclairdelalune == requiredKeyAuclairdelalune) {
      codePositionAuclairdelalune++;  
      if (codePositionAuclairdelalune == auclairdelalune.length) {
        successAuclairdelalune();
        codePositionAuclairdelalune = 0;
      }
    } else {
      codePositionAuclairdelalune = 0;
    }
});
  
function successAuclairdelalune() {
  window.alert('test2');
}