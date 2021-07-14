export default class SortingTable {

  constructor(table) { this.table = table }

  sortRowsByTitle() {
    const rows = this.table.querySelectorAll('tr')
    const sortedRows = []

    for(let i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i])
    }

    if (this.table.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      sortedRows.sort(this.compareRowsAsc)
      this.table.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.table.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
      sortedRows.sort(this.compareRowsDesc)
      this.table.querySelector('.octicon-arrow-down').classList.remove('hide')
      this.table.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    const sortedTable = document.createElement('table')
    sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++) {
      sortedTable.appendChild(sortedRows[i])
    }

    this.table.parentNode.replaceChild(sortedTable, this.table)
  }

  compareRowsAsc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent
    const testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {return -1}
    if (testTitle1 > testTitle2) {return 1}
    return 0
  }

  compareRowsDesc(row1, row2) {
    const testTitle1 = row1.querySelector("td").textContent
    const testTitle2 = row2.querySelector("td").textContent

    if (testTitle1 > testTitle2) {return -1}
    if (testTitle1 < testTitle2) {return 1}
    return 0
  }

}
