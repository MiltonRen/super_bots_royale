import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const audio = new Audio('https://res.cloudinary.com/dyhembxj3/video/upload/v1688448111/shofar_xntio5.mp3');
    audio.volume = 1;
    audio.play();
  }
}
