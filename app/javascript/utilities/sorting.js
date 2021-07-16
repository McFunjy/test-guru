export default class SortingTable {

  constructor(table) {
    this.table = document.querySelector(table) 
  }

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
    return row1.cells[0].innerHTML > row2.cells[0].innerHTML ? 1 : -1
  }

  compareRowsDesc(row1, row2) {
    return row1.cells[0].innerHTML < row2.cells[0].innerHTML ? 1 : -1
  }
}
