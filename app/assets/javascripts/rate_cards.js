
jQuery(function() {

  $('#rate_card_index_filter_button').click(function(){
    var vendors = [];
    vendor_id = $('#rate_card_rate_card_id').val();

    $.ajax( {
      //method: 'GET', (API says default is async/GET)
      //async: true,
      url:  "/rate_cards/index2",
      contentType: 'application/json',
      data: {vendor_id: vendor_id },
      dataType: 'json',
      success: function(dataVen, textStatus, jqXHR) {
        $('#rate_card_index_table tbody').empty();
         for (i = 0; i < dataVen.length; i++) {
         var rate_card = dataVen[i];
         $('#rate_card_index_table').append('<tr>'+
         '<td>'+rate_card.id+'</td>'+
         '<td>'+rate_card.name+'</td>'+
         '<td>'+rate_card.vehicle+'</td>'+
         '<td>'+rate_card.service+'</td>'+
         '<td>'+rate_card.rate+'</td>'+
         '<td>'+rate_card.active+'</td>'+
         '<td> <a href="vendor_contracts/'+rate_card.id+'/edit">Edit</a></td>'+
         '<td> <a href="vendor_contracts/'+rate_card.id+'">Show</a></td></tr>');


       }
       alert("loaded");
       }

    });

    });
  });
