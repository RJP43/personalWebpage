window.onload = rotate

       var thisImage = 0;
          
            
            function rotate() {
          var images = new Array ('my_images/01.jpg', 'my_images/02.jpg', 'my_images/03.jpg', 'my_images/04.jpg', 'my_images/05.jpg', 'my_images/06.jpg', 'my_images/07.jpg', 'my_images/08.jpg', 'my_images/09.jpg', 'my_images/10.jpg')
  
  
      var thisImage = Math.floor(Math.random()*(images.length)) ;
   
thisImage++;
          if (thisImage == images.length) {
          thisImage = 0;
          
          }
       
          
          document.getElementById("rotator").src = images[thisImage];
         
         
          setTimeout(rotate, 9 * 1000);
          }
