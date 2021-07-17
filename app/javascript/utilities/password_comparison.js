export default class PasswordComparison {
  constructor(form) {
    this.form = form
    this.password = form.user_password
    this.confirmPassword = form.user_password_confirmation

    this.setup()
  }

  hideIcons() {
    this.password.parentElement.querySelector('.octicon-check').classList.add('hide')
    this.password.parentElement.querySelector('.octicon-x').classList.add('hide')
    this.confirmPassword.parentElement.querySelector('.octicon-check').classList.add('hide')
    this.confirmPassword.parentElement.querySelector('.octicon-x').classList.add('hide')
  }
  
  check() {
    this.hideIcons()
    if(this.password.value === this.confirmPassword.value) {
      this.password.parentElement.querySelector('.octicon-check').classList.remove('hide')
      this.confirmPassword.parentElement.querySelector('.octicon-check').classList.remove('hide')
    } else {
      this.password.parentElement.querySelector('.octicon-x').classList.remove('hide')
      this.confirmPassword.parentElement.querySelector('.octicon-x').classList.remove('hide')
    }
  }

  setup() {
    this.form.addEventListener('keyup', event => {
      if (this.confirmPassword.value != '') this.check()
    })
  }
}
