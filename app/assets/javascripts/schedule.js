$(document).ready(function () {
  hide_show_day_week_date_in_schedule_modal($('#schedule_schedule_type'));
});

function hide_show_day_week_date_in_schedule_modal(element)
{
  if ($(element).val() === "Time of Day")
  {
    $('.time_of_day').show();
    $('.day_of_week').hide();
    $('.date_range').hide();
  }
  else if ($(element).val() === "Day of Week")
  {
    $('.time_of_day').hide();
    $('.day_of_week').show();
    $('.date_range').hide();
  }
  else
  {
    $('.time_of_day').hide();
    $('.day_of_week').hide();
    $('.date_range').show();
  }
}