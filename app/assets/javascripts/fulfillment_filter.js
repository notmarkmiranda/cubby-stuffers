$(document).ready(function () {
  var $fulfillments = $('.fulfillment');

  // $('#fulfillment_filter_modules').on('change', function () {
  //   var currentModule = this.value;
  //   $fulfillments.each(function (index, fulfillment) {
  //     $fulfillment = $(fulfillment);
  //     if ($fulfillment.find('.mod').text() === currentModule) {
  //       $fulfillment.show();
  //     } else if (currentModule === "All Modules") {
  //       $fulfillment.show();
  //     } else {
  //       $fulfillment.hide();
  //     }
  //   });
  // });

  // $('#fulfillment_filter_weeks').on('change', function () {
  //   var currentWeek = this.value;
  //   $fulfillments.each(function (index, fulfillment) {
  //     $fulfillment = $(fulfillment);
  //     if ($fulfillment.find('.week').text() === currentWeek) {
  //       $fulfillment.show();
  //     } else if (currentWeek === "All Weeks") {
  //       $fulfillment.show();
  //     } else {
  //       $fulfillment.hide();
  //     }
  //   });
  // });
  //
  // $('#fulfillment_filter_users').on('change', function () {
  //   var currentUser = this.value;
  //   $fulfillments.each(function (index, fulfillment) {
  //     $fulfillment = $(fulfillment);
  //     if ($fulfillment.find('.email').text() === currentUser) {
  //       $fulfillment.show();
  //     } else if (currentUser === "All Users") {
  //       $fulfillment.show();
  //     } else {
  //       $fulfillment.hide();
  //     }
  //   });
  // });
  //
  // $('#fulfillment_filter_status').on('change', function () {
  //   var currentStatus = this.value;
  //   $fulfillments.each(function (index, fulfillment) {
  //     $fulfillment = $(fulfillment);
  //     if ($fulfillment.find('.status').text() === currentStatus) {
  //       $fulfillment.show();
  //     } else if (currentStatus === "All") {
  //       $fulfillment.show();
  //     } else {
  //       $fulfillment.hide();
  //     }
  //   });
  // });

  $('.all_filters').children().on('change', function () {
    // debugger
    // var allFulfillmentText = $('.fulfillment').children().text();
    var currentMod = $('#fulfillment_filter_module').val();
    var currentWeek = $('#fulfillment_filter_week').val();
    var currentUser = $('#fulfillment_filter_user').val();
    // var currentStatus = $('#fulfillment_filter_status').val();
    var selections = [currentMod, currentWeek, currentUser];
    var test = $(this).text();
    debugger
     hideFulfillments.hide();
  //   $fulfillments.each(function (index, fulfillment) {
  //     $fulfillment = $(fulfillment);
  //     if ($fulfillment.find('.mod').text() === currentMod) {
  //       $fulfillment.show();
  //     } else if (currentMod === "All Modules") {
  //       $fulfillment.show();
  //     } else {
  //       $fulfillment.hide();
  //     }
  //   });
  });

});
