jQuery(function() {
  var cities;
  cities = $('#vendor_city_id').html();
  console.log(cities);
  return $('#vendor_state_id').change(function() {
    var state , options;
    state = $('#vendor_state_id :selected').text();
    options = $(cities).filter("optgroup[label='"+state+"']").html();
    console.log(options);
    if (options) {
      return $('#vendor_city_id').html(options);
    } else {
      return $('#vendor_city_id').empty();
    }
  });
});
jQuery(function() {
  var regions;
  regions = $('#vendor_region_id').html();
  console.log(regions);
  return $('#vendor_city_id').change(function() {
    var state , options2;
    city = $('#vendor_city_id :selected').text();
    options2 = $(regions).filter("optgroup[label='"+city+"']").html();
    console.log(options2);
    if (options2) {
      return $('#vendor_region_id').html(options2);
    } else {
      return $('#vendor_region_id').empty();
    }
  });
});

jQuery(function() {

  $('#vendor_index_filter_button').click(function(){
    var vendors = [];
    state = $('#vendor_state_id').val();
    city = $('#vendor_city_id ').val();
    region = $('#vendor_region_id').val();
    console.log(state);
    console.log(city);
    console.log(region);
    $.ajax( {
      //method: 'GET', (API says default is async/GET)
      //async: true,
      url:  "/vendors/index2",
      contentType: 'application/json',
      data: {state: state ,city: city ,  region: region},
      dataType: 'json',
      success: function(dataVen, textStatus, jqXHR) {
        $('#vendor_index_table tbody').empty();
         for (i = 0; i < dataVen.length; i++) {
         var vendors = dataVen[i];
         $('#vendor_index_table').append('<tr>'+
         '<td>'+vendors.id+'</td>'+
         '<td>'+vendors.name+'</td>'+
         '<td>'+vendors.address1+'</td>'+
         '<td>'+vendors.address2+'</td>'+
         '<td>'+vendors.region+'</td>'+
         '<td>'+vendors.city+'</td>'+
         '<td>'+vendors.state+'</td>'+
         '<td>'+vendors.ranking+'</td>'+
         '<td>'+vendors.vendor_type+'</td>'+
         '<td>'+vendors.contact_name_1+'</td>'+
         '<td>'+vendors.contact_email_1+'</td>'+
         '<td>'+vendors.contact_mob_1+'</td>'+
         '<td>'+vendors.listing_category+'</td>'+
         '<td> <a href="vendors/'+vendors.id+'/edit">Edit</a></td>'+
         '<td> <a href="vendors/'+vendors.id+'">Show</a></td></tr>');


       }
       alert("loaded");
       }

    });

    });
  });
