$(document).ready(function () {
  var $fulfillments = $('.fulfillment');

  $('.all_filters').children().on('change', function () {
    var currentMod = $('#fulfillment_filter_module').val();
    var currentWeek = $('#fulfillment_filter_week').val();
    var currentUser = $('#fulfillment_filter_user').val();
    var currentStatus = $('#fulfillment_filter_status').val();

    var validMods = checkMod(currentMod);
    var validWeeks = checkWeek(currentWeek);
    var validUsers = checkUser(currentUser);
    var validStatuses = checkStatuses(currentStatus);
    var validArrays = [validMods, validWeeks, validUsers, validStatuses];

    var showFulfillments = intersection(validArrays);

    $fulfillments.each(function(index, fulfillment) {
      $fulfillment = $(fulfillment);
      if (showFulfillments.includes(fulfillment)) {
        $fulfillment.show();
      } else {
        $fulfillment.hide();
      }
    });
  });

  function intersection(group) {
    var result = group.shift().filter(function(v) {
      return group.every(function(a) {
        return a.indexOf(v) !== -1;
      });
    });
    return result;
  }

  function checkMod(currentMod) {
    var valid = [];
	  $fulfillments.each(function(index, fulfillment) {
      if (fulfillment.querySelector(".mod").innerText === currentMod) {
        valid.push(fulfillment);
      } else if (currentMod === "All Modules") {
        valid.push(fulfillment);
      }
	});
  return valid;
  }

  function checkWeek(currentWeek) {
    var valid = [];
	  $fulfillments.each(function(index, fulfillment) {
      if (fulfillment.querySelector(".week").innerText === currentWeek) {
        valid.push(fulfillment);
      } else if (currentWeek === "All Weeks") {
        valid.push(fulfillment);
      }
	});
  return valid;
  }

  function checkUser(currentUser) {
    var valid = [];
	  $fulfillments.each(function(index, fulfillment) {
      if (fulfillment.querySelector(".email").innerText === currentUser) {
        valid.push(fulfillment);
      } else if (currentUser === "All Users") {
        valid.push(fulfillment);
      }
	});
  return valid;
  }

  function checkStatuses(currentStatus) {
    var valid = [];
	  $fulfillments.each(function(index, fulfillment) {
      if (fulfillment.querySelector(".status").innerText === currentStatus) {
        valid.push(fulfillment);
      } else if (currentStatus === "All") {
        valid.push(fulfillment);
      }
	});
    debugger
  return valid;
  }

});
