import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const audio = new Audio('https://res.cloudinary.com/dyhembxj3/video/upload/v1687683694/weapon_level_up_j197ng.mp3');
    audio.volume = 0.7;
    audio.play();
  }
}
