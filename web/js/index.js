!function(t){var i=t(window);t.fn.visible=function(t,e,o){if(!(this.length<1)){var r=this.length>1?this.eq(0):this,n=r.get(0),f=i.width(),h=i.height(),o=o?o:"both",l=e===!0?n.offsetWidth*n.offsetHeight:!0;if("function"==typeof n.getBoundingClientRect){var g=n.getBoundingClientRect(),u=g.top>=0&&g.top<h,s=g.bottom>0&&g.bottom<=h,c=g.left>=0&&g.left<f,a=g.right>0&&g.right<=f,v=t?u||s:u&&s,b=t?c||a:c&&a;if("both"===o)return l&&v&&b;if("vertical"===o)return l&&v;if("horizontal"===o)return l&&b}else{var d=i.scrollTop(),p=d+h,w=i.scrollLeft(),m=w+f,y=r.offset(),z=y.top,B=z+r.height(),C=y.left,R=C+r.width(),j=t===!0?B:z,q=t===!0?z:B,H=t===!0?R:C,L=t===!0?C:R;if("both"===o)return!!l&&p>=q&&j>=d&&m>=L&&H>=w;if("vertical"===o)return!!l&&p>=q&&j>=d;if("horizontal"===o)return!!l&&m>=L&&H>=w}}}}(jQuery);
$(document).ready(function(){
  if ($('#position-check').visible(true)) {
       if ($('#fixed-bot').attr('data-state') !== 'normal' ) {
         $('#fixed-bot').attr('data-state', 'normal');
       }
    } else {
       if ($('#fixed-bot').attr('data-state') == 'normal' ) {
         $('#fixed-bot').attr('data-state', 'closed');
        }
    }
});
var userScrolled = false;
$(window).scroll(function() {
  userScrolled = true;
});
setInterval(function() {
  if (userScrolled) {

    if ($('#position-check').visible(true)) {
       if ($('#fixed-bot').attr('data-state') !== 'normal' ) {
         $('#fixed-bot').attr('data-state', 'normal');
        }
    } else {
       if ($('#fixed-bot').attr('data-state') == 'normal' ) {
         $('#fixed-bot').attr('data-state', 'closed');
        }
    }
    userScrolled = false;
  }
}, 200);

var animDelay = 0;
var lines = $(".typeHere div").length;
var lineCtr = 0;
$(".typeHere div").each(function(){
   var charCount = $(this).text().length;
   var typeDuration = charCount / 16;
   $(this).css({
    "-webkit-animation" : "typing " + typeDuration + "s steps(" + charCount + ", end) forwards, blink 1s step-end 1s infinite",
    "-moz-animation" : "typing " + typeDuration + "s steps(" + charCount + ", end) forwards, blink 1s step-end 1s infinite",
    "animation-delay" : animDelay + "s"});
   var that = $(this);
   setTimeout(function(){
       that.css('opacity', '1');
   },animDelay*1000);
   animDelay += typeDuration;
   lineCtr += 1;
   if(lineCtr != lines)
   {
       setTimeout(function(){
           that.css('border-right', '0');
       },animDelay*1000);
   }
});

$('#fixed-bot .fixed-bot-image').click(function() {
  if ($('#fixed-bot').attr('data-state') === 'closed' ) {
   $('#fixed-bot').attr('data-state', 'opened');
  }
});
$('#fixed-bot .close').click(function() {
  if ( $('#fixed-bot').attr('data-state') === 'opened' ) {
    $('#fixed-bot').attr('data-state', 'closed');
  }
});