import { Controller } from 'stimulus';

export default class DownloadsController extends Controller {
  static targets = ['template', 'list'];

  prepend() {
    const { templateTarget, listTarget } = this;
    const templateClone = templateTarget.cloneNode(true).children[0];

    listTarget.prepend(templateClone);
    listTarget.querySelector('input').focus();
  }
}