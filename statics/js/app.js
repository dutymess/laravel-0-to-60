/**
 * Laravel 0 to 60
 * -------------------------
 * Created Negar Jamalifard
 * n.jamalifard@gmail.com
 * On 2018-02-04
 */
hljs.initHighlightingOnLoad();
hljs.initLineNumbersOnLoad();

 jQuery(function($){

     $('.sidebar_toggle').on('click',function () {
         $('#sidebar').toggleClass('is-open');
     });

     /*
      * Get Window Pathname
      * */
     var pathname = window.location.pathname;
     $('#sidebar a[href="'+pathname+'"]').addClass('active');

 }); //End Of siaf!