export default class ProgressBar {
  constructor(progress) {
    this.progress = progress

    this.calulate()
  }

  calulate() {
    const percent = this.progress.dataset.current  * 100 / this.progress.dataset.count

    this.output(percent)
  }

  output(percent) {
    const progressBar = document.querySelector('.progress')
    progressBar.setAttribute('style', 'width: ' + percent + '%')
  }
}
