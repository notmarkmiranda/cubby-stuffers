$(document).ready(function () {
  var $fulfillments = $('.fulfillment');

  $('#fulfillment_filter_modules').on('change', function () {
    var currentModule = this.value;
    $fulfillments.each(function (index, fulfillment) {
      $fulfillment = $(fulfillment);
      if ($fulfillment.find('.mod').text() === currentModule) {
        $fulfillment.show();
      } else if (currentModule === "All Modules") {
        $fulfillment.show();
      } else {
        $fulfillment.hide();
      }
    });
  });

  $('#fulfillment_filter_weeks').on('change', function () {
    var currentWeek = this.value;
    $fulfillments.each(function (index, fulfillment) {
      $fulfillment = $(fulfillment);
      if ($fulfillment.find('.week').text() === currentWeek) {
        $fulfillment.show();
      } else if (currentWeek === "All Weeks") {
        $fulfillment.show();
      } else {
        $fulfillment.hide();
      }
    });
  });

  $('#fulfillment_filter_users').on('change', function () {
    var currentUser = this.value;
    $fulfillments.each(function (index, fulfillment) {
      $fulfillment = $(fulfillment);
      if ($fulfillment.find('.email').text() === currentUser) {
        $fulfillment.show();
      } else if (currentUser === "All Users") {
        $fulfillment.show();
      } else {
        $fulfillment.hide();
      }
    });
  });

  $('#fulfillment_filter_status').on('change', function () {
    var currentStatus = this.value;
    $fulfillments.each(function (index, fulfillment) {
      $fulfillment = $(fulfillment);
      if ($fulfillment.find('.status').text() === currentStatus) {
        $fulfillment.show();
      } else if (currentStatus === "All") {
        $fulfillment.show();
      } else {
        $fulfillment.hide();
      }
    });
  });
});
