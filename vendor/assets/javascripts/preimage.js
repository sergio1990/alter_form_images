(function( $ ){
  var settings = {
  	'scale': 'contain', // cover
  	'prefix': 'prev_',
		'types': ['image/gif', 'image/png', 'image/jpeg'],
		'mime': {'jpe': 'image/jpeg', 'jpeg': 'image/jpeg', 'jpg': 'image/jpeg', 'gif': 'image/gif', 'png': 'image/png', 'x-png': 'image/png', 'tif': 'image/tiff', 'tiff': 'image/tiff'}
	};

  var methods = {
    init : function( options ) {
      settings = $.extend(settings, options);
      return this.each(function() {
        $(this).bind('change', methods.change);
      });
    },

    destroy : function( ) {
      return this.each(function() { $(this).unbind('change') })
    },

    change : function(event) {

      var imageContainer = $(this).parents('.alter-image-block').find('.alter-image-preview');
      var fileNameContainer = $(this).parents('.alter-image-block').find('.file-name');


      if ($(this).parent().attr('class') == 'field_with_errors') {
        $(this).parent().replaceWith($(this));
      }

      if(window.FileReader){
      	for(i=0; i<this.files.length; i++) {
          if(!$.inArray(this.files[i].type, settings['types']) == -1) {
            window.alert("File of not allowed type");
            return false;
          }
        }

   	    for(i=0; i<this.files.length; i++){
          var fileName = this.files[i].name;
   	    	var reader = new FileReader();
    		  reader.onload = function (e) {
            imageContainer.attr('src', e.target.result);

            if(fileNameContainer) fileNameContainer.html(fileName);
    		  };
    		  reader.readAsDataURL(this.files[i]);
   	    }
     	}
     }
  };

  $.fn.preimage = function( method ) {
    if ( methods[method] ) {
		return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));
    } else if ( typeof method === 'object' || ! method ) {
		return methods.init.apply( this, arguments );
    } else {
		$.error( 'Method ' +  method + ' does not exist on jQuery.preimage' );
    }

  };

})( jQuery );

