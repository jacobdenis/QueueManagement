(function ($) {
    //    "use strict";


    /*  Data Table
    -------------*/

 	// $('#bootstrap-data-table').DataTable();


    $('#bootstrap-data-table').DataTable({
        lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "All"]],
    });



    $('#bootstrap-data-table-export').DataTable({
        dom: 'lBfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });






})(jQuery);