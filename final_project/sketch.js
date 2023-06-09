// Variable para el reconocimiento de voz
let speechRec;
// Array dinámico con las canciones
let canciones = [];
// Variable para guardar el resultado del reconocimiento de voz
let speechValue = "";
// Variables para pasar entre canciones
let index = 0;
let auxiliar = 11;
let isPlaying = false;
let myShader;
let amplitud;
let isListening = false;
let color = 155;
let noise;

function preload() {
    
    soundFormats('mp3');
    canciones.push([loadSound("sound_files/camisanegra"),"la camisa negra"]);
    canciones.push([loadSound("sound_files/lamentoboliviano"),"lamento boliviano"]);
    canciones.push([loadSound("sound_files/sodaestereo"),"de música ligera"]);
    canciones.push([loadSound("sound_files/labiosrotos"),"labios rotos"]); 
    canciones.push([loadSound("sound_files/enalgunlugar"),"en algún lugar"]);
    canciones.push([loadSound("sound_files/devuelvemeamichica"),"devuélveme a mi chica"]); 
    canciones.push([loadSound("sound_files/hijodelaluna"),"hijo de la luna"]);
    canciones.push([loadSound("sound_files/rosas"),"rosas"]); 
    canciones.push([loadSound("sound_files/milhoras"),"1000 horas"]);
    canciones.push([loadSound("sound_files/trenalsur"),"tren al sur"]); 
    canciones.push([loadSound("sound_files/colgandoentusmanos"),"colgando en tus manos"]);
    canciones.push([loadSound("sound_files/tabacochanel"),"tabaco y chanel"]); 

    myShader = loadShader("shaders/shader.vert", "shaders/shader.frag");

    noise = loadImage("noise.png");
}

function setup() {
    createCanvas(windowWidth, windowHeight, WEBGL);

    background(color);

    speechRec = new p5.SpeechRec('es-ES');
    speechRec.continuous = true; // Habilitar reconocimiento de voz continuo
    speechRec.interimResults = true; // Habilitar resultados intermedios
    speechRec.onResult = gotSpeech;
    //speechRec.start();

    amplitud = new p5.Amplitude();

    // Crear botón para activar y desactivar el reconocimiento de voz
    let activateButton = createButton("Quiero hablar");
    activateButton.position(10, 10);
    activateButton.mousePressed(activateRecognition);
}

function activateRecognition() {
  if (!isListening) {
    color = 0;
    speechRec.start(); // Iniciar el reconocimiento de voz
    isListening = true;
  } else {
    color = 155;
    speechRec.stop(); // Detener el reconocimiento de voz
    isListening = false;
  }
}

function gotSpeech() {
  speechValue = speechRec.resultString;
  if (speechValue) {
    speechValue = speechValue.replace(".", "");
    speechValue = speechValue.toLowerCase();
    console.log(speechValue);
  }
}

function draw() {

  background(color);

  let level = amplitud.getLevel();

  // Pasamos la amplitud al shader
  myShader.setUniform("uLevel", level);

  // Condiciones para reproducir y detener canciones
  if (speechValue == "para" && isPlaying){
    parar();
  } else if (speechValue == "siguiente" && !isPlaying) {
    empezar();
    // Send the frameCount to the shader
    myShader.setUniform("uFrameCount", frameCount);
    myShader.setUniform("uNoiseTexture", noise);

    // Rotate our geometry on the X and Y axes
    rotateX(frameCount * 0.01);
    rotateY(frameCount * 0.005);
  } 

  // Cambio de índice para comenzar nuevamente
  if (index == canciones.length || index == 0){
    index = 0;
    auxiliar = 11;
  }  

  // Reconocimiento del título de la canción
  if (speechValue == canciones[auxiliar][1]) {
    console.log("Correcto");
    parar();
    empezar();
  }

  if (auxiliar%2==0){
    // shader() sets the active shader with our shader
    shader(myShader);
    // Send the frameCount to the shader
    myShader.setUniform("uFrameCount", frameCount);
    myShader.setUniform("uNoiseTexture", noise);

    // Rotate our geometry on the X and Y axes
    rotateX(frameCount * 0.01+level);
    rotateY(frameCount * 0.005+level);

    // Draw some geometry to the screen
  // We're going to tessellate the sphere a bit so we have some more geometry to work with
    sphere(width / 7, 200, 200);
  }else{
    // shader() sets the active shader with our shader
    shader(myShader);
      // Send the frameCount to the shader
    myShader.setUniform("uFrameCount", frameCount);

    // Rotamos la figura en función del tiempo y la amplitud del audio
    rotateX(frameCount * 0.01 + level);
    rotateY(frameCount * 0.005 + level);

    // Draw some geometry to the screen
  // We're going to tessellate the sphere a bit so we have some more geometry to work with
    sphere(width / 7, 200, 200);
  }
  
} 

function parar() {
  canciones[auxiliar][0].stop();
  isPlaying = false;
}

function empezar() {
  canciones[index][0].play();
  auxiliar = index;
  index += 1;
  isPlaying = true;
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
