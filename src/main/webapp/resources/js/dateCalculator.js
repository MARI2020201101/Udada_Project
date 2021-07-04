
 var rightNow = new Date().toLocaleString("ko-KR", {timeZone: "Asia/Seoul"});
 var today = rightNow.slice(0,10).replace(/-/g," - ");
 $("h5#today").text(" [ "+  today +" ] " );



