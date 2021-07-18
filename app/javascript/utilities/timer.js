export default class Timer {

  constructor(timer) {
  	this.timer = timer
  	this.second = timer.dataset.second

  	this.setup()
  }

  editTime() {
  	if (this.second <= 0){
  	  clearInterval(this.id)
  	  document.forms.passed_test.submit()
  	} else {
  	  this.timer.innerHTML = Math.floor(this.second / 60) + ":" + Math.floor(this.second % 60)
  	  this.second--
  	}
  }

  setup() {
  	this.id = setInterval(() => this.editTime(), 1000)
  }
}