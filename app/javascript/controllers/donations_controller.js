import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["amount","table","progressBar"]

  addDonation(){
    let amount = this.amountTarget.value
    updateDonationsTable(this.tableTarget, {user:'Anonymous',amount:amount,time:'Just now'})
    updateProgressBar(this.progressBarTarget, parseFloat(amount))
    alert('Thanks for fighting back CoVid')
    $('#donateModal').modal('hide')
  }
}

function updateProgressBar(barTarget,amount){
  var bar = $(barTarget).find(".progress>.progress-bar")
  var prevAmount = bar.attr('aria-valuenow')
  var newAmount = parseFloat(prevAmount) + amount
  var percent = (newAmount*100)/parseFloat(bar.attr('aria-valuemax'))
  bar.attr('aria-valuenow', newAmount.toString())
  bar.attr('style', `width: ${percent}%`)
  $(barTarget).find('.row>.current').html('$'+newAmount)
}
function updateDonationsTable(tableTarget, rowdata){
  $(tableTarget).find('table>tbody').prepend(`<tr>
    <td>${rowdata.user}</td>
    <td>${rowdata.amount}</td>
    <td>${rowdata.time}</td>
  </tr>`)
  var rows = $(tableTarget).find('table>tbody>tr')
  // Only 5 rows max
  if (rows.length > 5){
    rows[rows.length-1].remove()
  }
}