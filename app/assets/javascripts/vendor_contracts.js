
jQuery(function() {

  $('#vendor_contract_index_filter_button').click(function(){
    var vendors = [];
    vendor_id = $('#vendor_contract_vendor_contract_id').val();
    console.log(vendor_id);
    $.ajax( {
      //method: 'GET', (API says default is async/GET)
      //async: true,
      url:  "/vendor_contracts/index2",
      contentType: 'application/json',
      data: {vendor_id: vendor_id },
      dataType: 'json',
      success: function(dataVen, textStatus, jqXHR) {
        $('#vendor_contract_index_table tbody').empty();
         for (i = 0; i < dataVen.length; i++) {
         var vendor_contract = dataVen[i];
         $('#vendor_contract_index_table').append('<tr>'+
         '<td>'+vendor_contract.id+'</td>'+
         '<td>'+vendor_contract.name+'</td>'+
         '<td>'+vendor_contract.start_date+'</td>'+
         '<td>'+vendor_contract.end_date+'</td>'+
         '<td>'+vendor_contract.comments+'</td>'+
         '<td>'+vendor_contract.listing_fees+'</td>'+
         '<td>'+vendor_contract.listing_fees_paid+'</td>'+
         '<td>'+vendor_contract.active+'</td>'+
         '<td> <a href="vendor_contracts/'+vendor_contract.id+'/edit">Edit</a></td>'+
         '<td> <a href="vendor_contracts/'+vendor_contract.id+'">Show</a></td></tr>');


       }
       alert("loaded");
       }

    });

    });
  });
