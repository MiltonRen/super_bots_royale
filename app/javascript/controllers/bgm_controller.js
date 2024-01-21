import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("BGM connect")
    this.audio = new Audio('https://res.cloudinary.com/dyhembxj3/video/upload/v1705802464/marsmusic.mp3');
    this.audio.volume = 1;
  }

  play() {
    console.log("BGM play")
    this.audio.play();
  }
}
