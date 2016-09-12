$(document).ready( function () {
  jQuery(function() {

    $('#vende_contrct_map_index_filter_button').click(function(){
      var vendors = [];
      vendor_id = $('#vende_contrct_map_vende_contrct_map_id').val();

      $.ajax( {
        //method: 'GET', (API says default is async/GET)
        //async: true,
        url:  "/vende_contrct_maps/index2",
        contentType: 'application/json',
        data: {vendor_id: vendor_id },
        dataType: 'json',
        success: function(dataVen, textStatus, jqXHR) {
          $('#vende_contrct_map_index_table tbody').empty();
          for (i = 0; i < dataVen.length; i++) {
            var vende_contrct_map = dataVen[i];
            $('#vende_contrct_map_index_table').append('<tr>'+
            '<td>'+vende_contrct_map.id+'</td>'+
            '<td>'+vende_contrct_map.name+'</td>'+
            '<td>'+vende_contrct_map.category+'</td>'+
            '<td>'+vende_contrct_map.commission+'</td>'+
            '<td>'+vende_contrct_map.is_inclusive+'</td>'+
            '<td>'+vende_contrct_map.active+'</td>'+
            '<td> <a href="vendor_contracts/'+vende_contrct_map.id+'/edit">Edit</a></td>'+
            '<td> <a href="vendor_contracts/'+vende_contrct_map.id+'">Show</a></td></tr>');


          }
          alert("loaded");
        }

      });

    });
  });
});
