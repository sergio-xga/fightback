import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    if ( $('#project_goal_deadline').length > 0 ){
      $('.datepicker').datetimepicker({
        icons: {
          time: "fa fa-clock-o",
          date: "fa fa-calendar",
          up: "fa fa-chevron-up",
          down: "fa fa-chevron-down",
          previous: 'fa fa-chevron-left',
          next: 'fa fa-chevron-right',
          today: 'fa fa-screenshot',
          clear: 'fa fa-trash',
          close: 'fa fa-remove'
        },
        minDate: $('#project_goal_deadline').val() != '' ? moment($('#project_goal_deadline').val()) : moment()
      });
    }
  }
}