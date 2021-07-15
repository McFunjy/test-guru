export default class PasswordComparison {
  constructor(form) {
    this.password = form.querySelector('.user_password')
    this.confirmPassword = form.querySelector('.user_password_confirmation')
  }

  check() {
    const passwordValue = this.password.querySelector('input').value
    const confirmPasswordValue = this.confirmPassword.querySelector('input').value

    if ((confirmPasswordValue == '') || (passwordValue == '')){
      this.password.querySelector('.octicon-check').classList.add('hide')
      this.password.querySelector('.octicon-x').classList.add('hide')
      this.confirmPassword.querySelector('.octicon-check').classList.add('hide')
      this.confirmPassword.querySelector('.octicon-x').classList.add('hide')
    }
    else if (passwordValue == confirmPasswordValue) {
      this.password.querySelector('.octicon-check').classList.remove('hide')
      this.password.querySelector('.octicon-x').classList.add('hide')
      this.confirmPassword.querySelector('.octicon-check').classList.remove('hide')
      this.confirmPassword.querySelector('.octicon-x').classList.add('hide')
    }
    else {
      this.password.querySelector('.octicon-check').classList.add('hide')
      this.password.querySelector('.octicon-x').classList.remove('hide')
      this.confirmPassword.querySelector('.octicon-check').classList.add('hide')
      this.confirmPassword.querySelector('.octicon-x').classList.remove('hide')
    }
  }
}
