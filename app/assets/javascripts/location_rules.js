$(document).ready(function () {
  get_all_location_rules($('#rate_group').val());
  hide_show_radius_address_in_location_rule_modal($('#location_rule_condition_type'));
});

function get_all_location_rules(group_rate_id)
{
  $.ajax({
    url: "/location_rules?group_rate_id=" + group_rate_id,
    type: "GET"
  });
}

function hide_show_radius_address_in_location_rule_modal(element)
{
  if ($(element).val() === "In the same state")
  {
    $('.radius-fields').hide();
  }
  else
  {
    $('.radius-fields').show();
  }
}