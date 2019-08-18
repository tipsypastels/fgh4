import { Controller } from 'stimulus';

export default class TabsController extends Controller {
  static targets = ['panel', 'pill'];

  connect() {
    const { hash } = window.location;
    if (!hash) {
      return;
    }

    this.setTab(hash.replace('#', ''));
  }

  change(e) {
    this.setTab(e.target.dataset.tab);
  }
  
  setTab(tabIndex) {
    window.location.hash = tabIndex;

    for (let panel of this.panelTargets) {
      this.applySelectedTab(tabIndex, panel, 'block', 'hidden');
    }

    for (let pill of this.pillTargets) {
      this.applySelectedTab(tabIndex, pill, this.activeClass);
    }
  }

  applySelectedTab(index, component, activeClass, passiveClass) {
    const { dataset, classList } = component;

    if (dataset.tab === index) {
      classList.remove(passiveClass);
      classList.add(activeClass);
    } else {
      classList.remove(activeClass);
      classList.add(passiveClass);
    }
  }

  get activeClass() {
    return this.data.get('activeClass') || 'tab-active';
  }
}