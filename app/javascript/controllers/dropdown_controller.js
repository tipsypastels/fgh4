import { Controller } from 'stimulus';

export default class DropdownController extends Controller {
  static targets = ['button', 'menu'];

  toggle(e) {
    const { classList } = this.menuTarget;
    console.log('dropdown clicked');

    if (classList.contains('hidden')) {
      this.openMenu();
    } else {
      this.closeMenu();
    }
  }

  openMenu = () => {
    this.menuTarget.classList.remove('hidden');
    window.addEventListener('click', this.closeMenu);
  }

  closeMenu = (e = undefined) => {
    if (e && [e.target, e.target.parentNode].includes(this.buttonTarget)) {
      return;
    }

    this.menuTarget.classList.add('hidden');
    window.removeEventListener('click', this.closeMenu);
  }
}