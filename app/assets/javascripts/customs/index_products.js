$(document).ready(function() {

  $('#search').keyup(function(e) {
    // e.keyCode == 13 , for handle button enter
    if (e.keyCode == 13) {
      $.ajax({
        url : '/products',
        type : 'GET',
        dataType : 'script',
        data : {
          "search" : $(this).val()
        }
      });
    }
  });

  $('#nama, #price').on('click', function() {
    // direction digunakan untuk menentukan arah sorting
    var direction = $('#direction').is(':checked');
    direction = direction ? 'asc' : 'desc';
    // method jQuery ajax untuk melakukan sorting
    $.ajax({
      // '/articles' mengarah ke alamat routes index articles
      url : '/products',
      type : 'GET',
      dataType : 'script',
      data : {
        // $(this).attr('id') digunakana untuk mendapatkan nama id
        "column" : $(this).attr('id'),
        "direction" : direction
      }
    });
  });

}); 