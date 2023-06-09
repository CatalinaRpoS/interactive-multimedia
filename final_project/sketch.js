let song;
let speechRec;

function preload() {
    soundFormats('mp3');
    song = loadSound('sound_files/track_1');
}

function setup() {
    createCanvas(windowWidth, windowHeight);
    speechRec = new p5.SpeechRec('es-ES', gotSpeech);
    speechRec.continuous = true; // Habilitar reconocimiento de voz continuo
    speechRec.interimResults = true; // Habilitar resultados intermedios
    speechRec.start();

    function gotSpeech() {
        console.log(speechRec.resultString);
    }
}

function draw() {
  if ((speechRec.resultString == "Para" || speechRec.resultString == "para") && song.isPlaying()){
    song.stop();
  } else if ((speechRec.resultString == "Sigue" || speechRec.resultString == "sigue") && !song.isPlaying()) {
    song.play();
  }
  background(0);
} 
