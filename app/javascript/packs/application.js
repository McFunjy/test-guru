// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import SortingTable from 'utilities/sorting'
import PasswordComparison from 'utilities/password_comparison'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', function() {

  const control = document.querySelector('.sort-by-title')
  const password = document.querySelector(".user_password")
  const confirmPassword = document.querySelector(".user_password_confirmation")

  if (control) { control.addEventListener('click', sortRows) }
  if (password) { password.addEventListener('input', passwordMatch) }
  if (confirmPassword) { confirmPassword.addEventListener('input', passwordMatch) }

  function sortRows() {
    new SortingTable('table').sortRowsByTitle()
  }

  function passwordMatch() {
    if (password && confirmPassword) {
      new PasswordComparison(password, confirmPassword).check()
    }
  }
})
