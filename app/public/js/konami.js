var allowedKeysKonami = {
    37: 'gauche',
    38: 'haut',
    39: 'droite',
    40: 'bas',
    65: 'a',
    66: 'b'
};

var konami = ['haut', 'haut', 'bas', 'bas', 'gauche', 'droite', 'gauche', 'droite', 'b', 'a'];

var codePositionKonami = 0;

document.addEventListener('keydown', function(e) {
    var keyKonami = allowedKeysKonami[e.keyCode];
    var requiredKeyKonami = konami[codePositionKonami];

    if (keyKonami == requiredKeyKonami) {
      codePositionKonami++;  
      if (codePositionKonami == konami.length) {
        successKonami();
        codePositionKonami = 0;
      }
    } else {
      codePositionKonami = 0;
    }
});

function successKonami() {
  if(document.body.classList.contains("blink")){
    document.body.classList.remove("blink");
  }else{
    document.body.classList.add("blink");
  }
  
}