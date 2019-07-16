import { Controller } from 'stimulus';
import Tribute from 'tributejs';
import Trix from 'trix';
import axios from 'axios';

export default class MentionsController extends Controller {
  static targets = ['field'];

  connect() {
    this.editor = this.fieldTarget.editor;
    this.initializeTribute();
  }

  disconnect() {
    this.tribute.detach(this.fieldTarget);
  }

  initializeTribute() {
    this.tribute = new Tribute({
      collection: [
        {
          allowSpaces: false,
          lookup: 'mentionable_name',
          values: this.fetchMentionables('users'),
        },
        {
          trigger: '#',
          allowSpaces: true,
          lookup: 'mentionable_name',
          values: this.fetchMentionables('recordings'),
        }
      ]
    });
    
    this.tribute.attach(this.fieldTarget);
    this.tribute.range.pasteHtml = this.pasteHtml;
    this.fieldTarget.addEventListener('tribute-replaced', this.replaced);
  }

  fetchMentionables(type) {
    return async function(text, callback) {
      try {
        const { data } = await axios.get(`/api/mentions/${type}?query=${text}`);
        callback(data.mentionables);
      } catch (e) {
        callback([]);
      }    
    }
  }

  replaced = (e) => {
    let mention = e.detail.item.original;
    let attachment = new Trix.Attachment({
      sgid: mention.sgid,
      content: mention.content,
    });

    this.editor.insertAttachment(attachment);
    this.editor.insertString(' ');
  }

  pasteHtml = (html, startPos, endPos) => {
    const { editor } = this;

    let position = editor.getPosition();
    editor.setSelectedRange([position - endPos, position]);
    editor.deleteInDirection('backward');
  }
}