import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['amount','projectId','paymentMethod','table','progressBar']

  addDonation(){
    if (!validateFields([this.amountTarget,this.projectIdTarget,this.paymentMethodTarget])){
      return "Missing/Invalid Parameters"
    }
    let amount = this.amountTarget.value
    let projectId = this.projectIdTarget.value
    let paymentMethod = this.paymentMethodTarget.value
    console.log(amount,projectId,paymentMethod)
    alert('Thanks for fighting back COVID19')

    loader('start')
    $.ajax({
      url: `/projects/${projectId}/donations/`,
      method: 'POST',
      data: {
        donation:{
          amount: amount,
          payment_method: paymentMethod
        }
      },
      success: (data)=>{
        console.log(data)
        updateDonationsTable(this.tableTarget, {user:'Anonymous',amount:amount,time:data.donation.created_at})
        updateProgressBar(this.progressBarTarget, parseFloat(amount))
      },
      complete: ()=>{
        loader('end')
      }
    })
  }
}

function validateFields(fields){
  var invalidFields = fields.filter((f)=>{ return f.checkValidity() == false })
  if (invalidFields.length > 0) {
    fields.forEach(function(f){
      f.reportValidity()
    })
    return false
  }
  return true
}
function loader(action='start'){
  if (action == 'start'){
    $('.modal-footer>.btn').hide()
    $('.modal-footer>.processing').removeClass('d-none')
  } else {
    $('.modal-footer>.btn').show()
    $('.modal-footer>.processing').addClass('d-none')
    $('#donateModal').modal('hide')
  }
}
function updateProgressBar(barTarget,amount,newAmount=null){
  var bar = $(barTarget).find('.progress>.progress-bar')
  if (!newAmount){
    var prevAmount = bar.attr('aria-valuenow')
    newAmount = parseFloat(prevAmount) + amount
  }
  var percent = (newAmount*100)/parseFloat(bar.attr('aria-valuemax'))
  bar.attr('aria-valuenow', newAmount.toString())
  bar.attr('style', `width: ${percent}%`)
  $(barTarget).find('.row>.current').html('$'+newAmount)
}
function updateDonationsTable(tableTarget, rowdata){
  $(tableTarget).find('table>tbody').prepend(`<tr>
    <td>${rowdata.user}</td>
    <td>${rowdata.amount}</td>
    <td>${moment(rowdata.time).format('MMMM Do, YYYY HH:mm')}</td>
  </tr>`)
  var rows = $(tableTarget).find('table>tbody>tr')
  // Only 5 rows max
  if (rows.length > 5){
    rows[rows.length-1].remove()
  }
}