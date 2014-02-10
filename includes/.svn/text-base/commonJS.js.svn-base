//#####################################
//Constants

DEFAULT_STATUS = "University of Hawai`i Community Colleges";

//#####################################
function viewNewWindowWithParams(pageRequested, pgWidth, pgheight){
    var mWin;
    //var winTop  = 0;
    //var winLeft = 0;
    var winParm = "width=pgWidth,height=pgheight,";
    winParm = winParm + "resizable=yes,";
    winParm = winParm + "scrollbars=yes,";
    winParm = winParm + "status,";
    winParm = winParm + "location,";
    winParm = winParm + "menubar=yes,";
    winParm = winParm + "left=0,";
    winParm = winParm + "top=0";

    if (mWin && !mWin.closed){
        mWin.close();

        mWin = window.open(pageRequested,'ETC',winParm);
        mWin.focus();
    }else{
        mWin = window.open(pageRequested,'ETC',winParm);
        mWin.focus();
    }
    mWin.moveTo(0,0);
    mWin.resizeTo(pgWidth, pgheight);
}



function writeDateModified(time){

    var days = new Array;                        // Array to hold day names
    var months = new Array;                      // Array to hold up month names

    // Load up day names
    days[0] = "Sunday";
    days[1] = "Monday";
    days[2] = "Tuesday";
    days[3] = "Wednesday";
    days[4] = "Thursday";
    days[5] = "Friday";
    days[6] = "Saturday";

    // Load up month names
    months[0] = "January";
    months[1] = "February";
    months[2] = "March";
    months[3] = "April";
    months[4] = "May";
    months[5] = "June";
    months[6] = "July";
    months[7] = "August";
    months[8] = "September";
    months[9] = "October";
    months[10] = "November";
    months[11] = "December";

    // Assign date variables with document.lastModified
    var modDate = new Date(Date.parse(document.lastModified));
  
    // If we have a valid date reformat it.
    if (modDate != 0) {
  
        // Set up day variable to hold the name of the day
        var day = days[modDate.getDay()];
    
        // ndate variable holds day of month
        var ndate = modDate.getDate();
    
        // Set up month variable to hold the name of the month
        var month = months[modDate.getMonth()];
    
        // Get the year and if it is less than 1000 add 1900 to it.
        var year = modDate.getYear();
        if (year < 1000) year = year + 1900;
    
        // Load up the time variables if required
        if (time) {
            var hour = modDate.getHours().toString();
            if (hour.length == 1) hour = "0" + hour;
            var minute = modDate.getMinutes().toString();
            if (minute.length == 1) minute = "0" + minute;
            var second = modDate.getSeconds().toString();
            if (second.length == 1) second = "0" + second;
        }
    
        // Display date and time document was last updated.
        document.write("Page last modified: " + month + " " + ndate +  ", " + year+ "  ");
        if (time) {
            document.write(hour + ":" + minute + ":" + second);
        }
    }
}


function ReloadThis(){
    //if browser resized...reload page...keeps rotating imgs in place
    var isIE  = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
    var isWin = (navigator.appVersion.toLowerCase().indexOf("win") != -1) ? true : false;
    if(isIE && isWin) {
        location.href = self.location.href;
    }
}


function WriteFooter(){
    var thisDate = new Date();
    var thisYear = thisDate.getYear();
    document.write("<div align='center'>" +
        "�Copyright 2006 - " + thisYear + " - University of Hawai'i Community Colleges <br>" +
        "Your campus name - campus address <br>" +
        "city, state, zip code<br>" +
        "Questions about this website contact someone@campus.edu");

}

function TopMenu(){
    var topMenuStr;
    topMenuStr = "<li><a href='../index.php' title='Home'>Home</a>| </li>" +
    "<li><a href='#' title='Frequently Asked Questions'>Frequently Asked Questions</a>| </li>" +
    "<li><a href='#' title='About Us'>About Us</a>| </li>" +
    "<li><a href='#' title='Contact Us'>Contact Us</a></li>";
    document.write(topMenuStr);
}


function MainNavHorizontal(){
    var mainNavHorizontalStr;
    mainNavHorizontalStr = "<li><br /><br /></li>" +
    "<li><a href='#'>Menu<br />Item 1</a></li>" +
    "<li><a href='#'>Menu<br />Item 2</a></li>" +
    "<li><a href='#'>Menu<br />Item 3</a></li>" +
    "<li><a href='#'>Menu<br />Item 4</a></li>" +
    "<li><a href='#'>Menu<br />Item 5</a></li>" +
    "<li><a href='#'>Menu<br />Item </a></li>";

    document.write(mainNavHorizontalStr);
}


function RightMenu(){

    var rightMenuStr;

	
    rightMenuStr = "<script src='../includes/boxover.js' type='text/javascript'></script>" +
    "<ul>" +
    "<li><DIV TITLE='header=[Live Aloha] body=[Living in Hawaii, photos, links, weather and webcams]' STYLE='BORDER: #ffffff 0px solid;WIDTH:110px;HEIGHT: 77px'>" +
    "<a href='#' class='subMenu'><img src='../images/careerConnections.jpg' border='0'></a></DIV></li>" +

    "<li><DIV TITLE='header=[Campus Life] body=[Student services, housing, theatres, clubs, activities, etc]' STYLE='BORDER: #ffffff 0px solid;WIDTH:110px;HEIGHT: 77px'>" +
    "<a href='#' class='subMenu'><img src='../images/campusLife.jpg' border='0'></a></DIV></li>" +

    "<li><DIV TITLE='header=[Alumni & Friends] body=[Join the Alumni Association of various campuses, career placement, UH Foundation]' STYLE='BORDER: #ffffff 0px solid;WIDTH:110px;HEIGHT: 77px'>" +
    "<a href='#' class='subMenu'><img src='../images/alumniFriends.jpg' border='0'></a></DIV></li>" +

    "<li><DIV TITLE='header=[My World] body=[Student testimonials about their college experience at UHCC.]' STYLE='BORDER: #ffffff 0px solid;WIDTH:110px;HEIGHT: 77px'>" +
    "<a href='#' class='subMenu'><img src='../images/my_world.jpg' border='0'></a></DIV></li>" +
    "</ul>";

    document.write(rightMenuStr);
}



function MM_swapImgRestore() { //v3.0
    var i,x,a=document.MM_sr;
    for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
    var d=document;
    if(d.images){
        if(!d.MM_p) d.MM_p=new Array();
        var i,j=d.MM_p.length,a=MM_preloadImages.arguments;
        for(i=0; i<a.length; i++)
            if (a[i].indexOf("#")!=0){
                d.MM_p[j]=new Image;
                d.MM_p[j++].src=a[i];
            }
    }
}
function preloadImgs(img_array) { //Added 3-2-2011 REQUIRES jQuery Library
    $(img_array).each(function(){
        (new Image()).src = "images/"+this;
    });
}

function MM_findObj(n, d) { //v4.01
    var p,i,x;
    if(!d) d=document;
    if((p=n.indexOf("?"))>0&&parent.frames.length) {
        d=parent.frames[n.substring(p+1)].document;
        n=n.substring(0,p);
    }
    if(!(x=d[n])&&d.all) x=d.all[n];
    for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
    for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
    if(!x && d.getElementById) x=d.getElementById(n);
    return x;
}

function MM_swapImage() { //v3.0
    var i,j=0,x,a=MM_swapImage.arguments;
    document.MM_sr=new Array;
    for(i=0;i<(a.length-2);i+=3)
        if ((x=MM_findObj(a[i]))!=null){
            document.MM_sr[j++]=x;
            if(!x.oSrc) x.oSrc=x.src;
            x.src=a[i+2];
        }
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
    window.open(theURL,winName,features);
}




















