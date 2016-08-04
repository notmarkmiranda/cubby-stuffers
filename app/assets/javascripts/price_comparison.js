$(document).ready(function(){
  $("#searchSubmit").removeAttr('disabled') // ensure search button is enabled

  $("#searchSubmit").on('click', function(e){
    e.preventDefault();

    searchClickEvents()

    var query = $("#searchField").val()
     
    $.ajax({
      url: "/api/v1/price-comparison/" + query,
      method: "GET",
      dataType: "JSON",
      success: function(response){
        $("#query").html("for '" + query + "'");
        successEvents()

        if (response.errors == "No Results") {
          appendErrorRow(response)
        } else {
          response.walmart_products.forEach(function(product) {
            appendRow(response.amazon_products, product, matchAmazonProduct);
          });
        }
      },
      error: function(errorResponse){
        console.log(errorResponse)
      }
    })
  })

  function searchClickEvents() {
    $("#table-body").html("");                 // clear table items
    $("#query").html("");                      // clear querty string in title
    $("#searchSubmit").prop('disabled', true); // disable the search button
    $("#loader").css('visibility', 'visible'); // show the loading spinner
  }

  function successEvents() {
    $("#searchSubmit").removeAttr('disabled'); // enable search button
    $("#loader").css('visibility', 'hidden');  // hide the loading spinner
  }

  function matchAmazonProduct(amazon_products, walmart_product) {
    product = amazon_products.filter(function(amazon_product) {
      return amazon_product.upc === walmart_product.upc;
    });
    return product;
  }

  function formatPrice(amazon_product) {
    if (amazon_product.price == null) {
      return "Not Available"
    } else {
      return "$" + calculateUnitPrice(amazon_product);
    };
  }

  function calculateUnitPrice(amazon_product) {
    return (convertCurrency(amazon_product.price) / convertCurrency(amazon_product.quantity)).toFixed(2);
  }

  function convertCurrency(currency) {
    return Number(currency.replace(/[^0-9\.]+/g,""));
  }

  function appendErrorRow(response) {
    $("#table-body").prepend("<tr>" + "<td colspan='5'>" + response.errors + "</td>" + "</tr>");
  }

  function appendRow(amazon_products, product) {
    var amazon_product = matchAmazonProduct(amazon_products, product)[0]
    amazon_product.price  = formatPrice(amazon_product)

    $("#table-body").prepend("<tr>" + 
      "<td>" + "<img src='" + product.image_path +"'/>"+ "</td>"  + 
      "<td>" + product.upc + "</td>" +
      "<td>" + product.name + "</td>" +
      "<td>" + "<a href='" + product.url +"'>" + "$" + product.price + "</a>" + "</td>" +
      "<td>" + "<a href='" + amazon_product.url +"'>" + amazon_product.price + "</a>" + "</td>" + "</tr>"
    );
  };
});
