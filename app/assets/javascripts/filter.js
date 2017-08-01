$(document).ready(function() {

  $('#end-date').on('click', function() {
    return $.ajax({
      url: 'localhost:3000/categories/1',
      dataType: 'json',
      contentType: 'application/json',
      method: 'GET'
    }).done(function(projects){
      debugger;
    })
  })

  $('#most-pledged').on('click', function() {
    alert("HEY")
  })

  $('#most-funded').on('click', function() {
    alert("HEY")
  })

  $('#magic').on('click', function() {
    alert("HEY")
  })

})
