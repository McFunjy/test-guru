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

document.addEventListener('turbolinks:load', event => {

  const control = document.querySelector('.sort-by-title')
  const form = document.getElementById('registration_form')

  if (control) { control.addEventListener('click', sortRows) }
  if (form) { new PasswordComparison(form) }

  function sortRows() {
    new SortingTable('table').sortRowsByTitle()
  }
})
