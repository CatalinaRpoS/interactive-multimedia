let song;
let speechRec;
let canciones = []
let index = 0;

function preload() {
    
    soundFormats('mp3');
    canciones.push([loadSound("sound_files/Billie-Jean"),"Billie Jean"]);
    canciones.push([loadSound("sound_files/Bittersweet-Symphony"),"Bittersweet Symphony"]);
    canciones.push([loadSound("sound_files/Eye-Of-The-Tiger"),"Eye Of The Tiger"]);
    canciones.push([loadSound("sound_files/Its-My-Life"),"Its My Life"]); 
    canciones.push([loadSound("sound_files/Lemon-Tree"),"Lemon Tree"]);
    canciones.push([loadSound("sound_files/Mr.-Blue-Sky"),"Mister Blue Sky"]); 
    canciones.push([loadSound("sound_files/My-Heart-Will-Go-On"),"My Heart Will Go On"]);
    canciones.push([loadSound("sound_files/Stayin-Alive"),"Stayin Alive"]); 
    canciones.push([loadSound("sound_files/Take-On-Me"),"Take On Me"]);
    canciones.push([loadSound("sound_files/The-Final-Countdown"),"The Final Countdown"]); 
    canciones.push([loadSound("sound_files/Wind-Of-Change"),"Wind Of Change"]);
    canciones.push([loadSound("sound_files/Wonderwall"),"Wonderwall"]); 
}

function setup() {
    createCanvas(windowWidth, windowHeight);
    speechRec = new p5.SpeechRec('es-ES', gotSpeech);
    speechRec.continuous = true; // Habilitar reconocimiento de voz continuo
    speechRec.interimResults = false; // Habilitar resultados intermedios
    speechRec.start();

    function gotSpeech() {
        console.log(speechRec.resultString);
    }
}

function draw() {
  if ((speechRec.resultString == "Para." || speechRec.resultString == "Para" || speechRec.resultString == "para") && canciones[index][0].isPlaying()){
    canciones[index][0].stop();
  } else if ((speechRec.resultString == "Sigue." || speechRec.resultString == "Sigue" || speechRec.resultString == "sigue") && !canciones[index][0].isPlaying()) {
    canciones[index][0].stop();
    index += 1;
    canciones[index][0].play();
  }

  if (index == canciones.length - 1){
    index = 0;
  }

  background(0);
} 
