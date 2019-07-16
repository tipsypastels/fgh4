import { Controller } from 'stimulus';
import axios from 'axios';

export default class FilterController extends Controller {
  async change({ target }) {
    let url = this.data.get('url');
    if (target.value !== 'all') {
      url += `?type=${target.value}`;
    }

    window.history.pushState({}, '', url);

    try {
      const { data } = await axios({
        url,
        type: 'get',
        headers: {
          'Accept': 'application/json',
        },
      }); 

      document.querySelector('#recordings-list').innerHTML = data;
    } catch(e) {
      console.error(e);
    }
  }
}