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

  var control = document.querySelector('.sort-by-title')
  var comparison = document.querySelectorAll('.match')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
  if (comparison[0]) { comparison[0].addEventListener('input', passwordMatch) }
  if (comparison[1]) { comparison[1].addEventListener('input', passwordMatch) }

  
})

let sortRowsByTitle = () => {
  var table = document.querySelector('table')
  new SortingTable(table).sortRowsByTitle()
}
let passwordMatch = () => {
  var comparison = document.querySelectorAll('.match')
  new PasswordComparison(comparison).check()
}
