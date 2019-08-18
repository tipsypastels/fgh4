import { Controller } from 'stimulus';
import axios from 'axios';

export default class ReplyController extends Controller {
  static targets = ['input'];

  open() {
    this.inputTarget.classList.remove('hidden');
  }

  close() {
    this.inputTarget.classList.add('hidden');
  }

  async submit(e) {
    e.preventDefault();

    const form = e.target;
    const data = new FormData(form);

    try {
      const response = await axios({
        data,
        method: 'post',
        url: form.action,
        config: { headers: { 'Content-Type': 'multipart/form-data' } }
      });

      const reply = response.data;
      this.insertReply(reply);
    } catch(e) {
      console.error(e);
    }

    return false;
  }

  insertReply(reply) {
    let $target;
    let parent = this.getParent();

    if (parent) {
      $target = $(`[data-reply-children-id="${parent}"]`);

      const $input = $(`[data-reply-input-id="${parent}"]`);
      $input.addClass('hidden');
      $input.find('trix-editor').val('');
    } else {
      $target = $('#replies-root');
      $('#reply-root-input trix-editor').val('');
    }

    $target.prepend(reply);
  }

  getParent() {
    return this.data.get('id');
  }
}