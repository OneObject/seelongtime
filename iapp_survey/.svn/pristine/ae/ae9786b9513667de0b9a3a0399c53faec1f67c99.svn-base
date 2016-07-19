<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@include file="/WEB-INF/jsp/include/student/taglibs.jsp"%>

    
        
      <!-- END PAGE -->
      
<script type="text/javascript">
      $(document).ready(function() {
    	  /* $(".page-sidebar-menu").find("li").each(function(){
              $(this).removeClass("active");
              $(this).removeClass("active");
          });
          $(".systemmanage").addClass("active");
          $(".systemmanage").find(".arrow").addClass("open");  
          $("#usermanage").addClass("active");  */ 
         App.init(); // initlayout and core plugins
         Index.init();
         Index.initJQVMAP(); // init index page's custom scripts
         Index.initCalendar(); // init index page's custom scripts
         Index.initCharts(); // init index page's custom scripts
         Index.initChat();
         Index.initMiniCharts();
         Index.initDashboardDaterange();
         Index.initIntro();
         Tasks.initDashboardWidget();
        //begin
         var owl = $("#owl-demo");
     
      owl.owlCarousel({
          items : 3, //10 items above 1000px browser width
          itemsDesktop : [1000,3], //5 items between 1000px and 901px
          itemsDesktopSmall : [900,2], // betweem 900px and 601px
          itemsTablet: [600,1], //2 items between 600 and 0
          itemsMobile : true // itemsMobile disabled - inherit from itemsTablet option
      });
     $(".live_box").find(".owl-item").each(function(){
         $(this).attr("style","width:202px;");
     });
      // Custom Navigation Events
      $(".next").click(function(){
        owl.trigger('owl.next');
      });
      $(".prev").click(function(){
        owl.trigger('owl.prev');
      });
      $(".play").click(function(){
        owl.trigger('owl.play',1000); //owl.play event accept autoPlay speed as second parameter
      });
      $(".stop").click(function(){
        owl.trigger('owl.stop');
      });
      //end
     });
         
</script>
