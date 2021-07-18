export default class FormInline {
  constructor(controls) {
    this.controls = controls
    this.setup()
  }

  static formInlineHandler(testId) {
    const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    const testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    const formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

    if (formInline.classList.contains('hide')) {
      testTitle.classList.add('hide')
      formInline.classList.remove('hide')
      link.textContent = 'Cancel'
    } else {
       testTitle.classList.remove('hide')
      formInline.classList.add('hide')
      link.textContent = 'Edit'
    }
  }

  formInlineLinkHandler(event) {
    event.preventDefault()
    const testId = this.dataset.testId
    FormInline.formInlineHandler(testId)
  }

  setup() {
    for (let i = 0; i < this.controls.length; i++) {
      this.controls[i].addEventListener('click', this.formInlineLinkHandler)    
    }
    const errors = document.querySelector('.resource-errors')
    if (errors) {
      const resourceId = errors.dataset.resourceId
      FormInline.formInlineHandler(resourceId)
    }
  }
}