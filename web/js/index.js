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