import { Controller } from "@hotwired/stimulus"
const confetti = require('canvas-confetti');

const inlineStylesFormObject = (styles = {}) => {
  const resultAsArray = Object.keys(styles).map((property) => {
    const value = styles[property]

    return `${property}:${value}`
  })

  return resultAsArray.join(";")
}

// Connects to data-controller="reward-animator"
export default class extends Controller {
  disconnect() {
    this.context.close();
  }

  connect() {
    this.context = new AudioContext();
    this.gainNode = this.context.createGain();
    this.gainNode.gain.setValueAtTime(2, this.context.currentTime);
    this.gainNode.connect(this.context.destination);

    this.loadAndPlay('https://res.cloudinary.com/dyhembxj3/video/upload/v1687806226/fanfare_ph3lpl.mp3', this.context, this.gainNode);

    // Create a canvas as big as the screen and make it fixed and ontop of everything
    // https://github.com/avo-hq/stimulus-confetti/blob/main/src/index.js
    const myCanvas = document.createElement("canvas")
    myCanvas.style.cssText = inlineStylesFormObject({
      position: "fixed",
      top: 0,
      right: 0,
      bottom: 0,
      left: 0,
      width: "100%",
      height: "100%",
      "pointer-events": "none",
      "z-index": "9999",
    })
    document.body.appendChild(myCanvas)

    // Launch confetti
    myCanvas.confetti = confetti.create(myCanvas, { resize: true });

    

    // myCanvas.confetti({
    //   spread: 70,
    //   origin: { y: 0.8 }
    // });

    var count = 200;
    var defaults = {
      origin: { y: 0.7 },
    };

    function fire(particleRatio, opts) {
      myCanvas.confetti(Object.assign({}, defaults, opts, {
        particleCount: Math.floor(count * particleRatio)
      }));
    }

    fire(0.25, {
      spread: 26,
      startVelocity: 55,
    });
    fire(0.2, {
      spread: 60,
    });
    fire(0.35, {
      spread: 100,
      decay: 0.91,
      scalar: 0.8
    });
    fire(0.1, {
      spread: 120,
      startVelocity: 25,
      decay: 0.92,
      scalar: 1.2
    });
    fire(0.1, {
      spread: 120,
      startVelocity: 45,
    });

    setTimeout(()=>{
      fire(0.25, {
        spread: 35,
        startVelocity: 55,
      });
      fire(0.2, {
        spread: 75,
      });
      fire(0.35, {
        spread: 200,
        decay: 0.91,
        scalar: 0.8
      });
      fire(0.1, {
        spread: 150,
        startVelocity: 25,
        decay: 0.92,
        scalar: 1.2
      });
      fire(0.1, {
        spread: 180,
        startVelocity: 45,
      });      
    }, 2000);

    setTimeout(()=>{
      fire(0.25, {
        spread: 80,
        startVelocity: 55,
      });
      fire(0.2, {
        spread: 100,
      });
      fire(0.35, {
        spread: 300,
        decay: 0.91,
        scalar: 0.8
      });
      fire(0.1, {
        spread: 250,
        startVelocity: 25,
        decay: 0.92,
        scalar: 1.2
      });
      fire(0.1, {
        spread: 200,
        startVelocity: 45,
      });      
    }, 3500);    
  }

  loadAndPlay(url, context, gainNode) {
    var request = new XMLHttpRequest();
    request.open('GET', url, true);
    request.responseType = 'arraybuffer';

    // Decode asynchronously
    request.onload = function() {
      context.decodeAudioData(request.response, function(sound_buffer) {
        var source = context.createBufferSource();
        source.connect(gainNode);
        source.buffer = sound_buffer;
        source.start();
      }, null);
    }

    request.send();
  }
}
