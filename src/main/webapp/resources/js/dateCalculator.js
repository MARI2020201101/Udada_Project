
 var rightNow = new Date();
 var today = rightNow.toISOString().slice(0,10).replace(/-/g," - ");
 $("h5#today").text(" [ "+  today +" ] " );



