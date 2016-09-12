jQuery(function() {

  $('#vender_service_map_index_filter_button').click(function(){
    var vendors = [];
    vendor_id = $('#vender_service_map_vender_service_map_id').val();

    $.ajax( {
      //method: 'GET', (API says default is async/GET)
      //async: true,
      url:  "/vender_service_maps/index2",
      contentType: 'application/json',
      data: {vendor_id: vendor_id },
      dataType: 'json',
      success: function(dataVen, textStatus, jqXHR) {
        $('#vendor_service_map_index_table tbody').empty();
         for (i = 0; i < dataVen.length; i++) {
         var vender_service_map = dataVen[i];
         $('#vendor_service_map_index_table').append('<tr>'+
         '<td>'+vender_service_map.name+'</td>'+
          '<td>'+vender_service_map.service+'</td>'+
         '<td>'+vender_service_map.vehicle+'</td>'+
         '<td>'+vender_service_map.commission+'</td>'+
            '<td>'+vender_service_map.is_inclusive+'</td>'+
         '<td>'+vender_service_map.active+'</td>'+
         '<td> <a href="vendor_contracts/'+vender_service_map.id+'/edit">Edit</a></td>'+
         '<td> <a href="vendor_contracts/'+vender_service_map.id+'">Show</a></td></tr>');


       }
       alert("loaded");
       }

    });

    });
  });
