/**
 * Created by hzj on 2017/9/19.
 */ 

/*内容加载完成时 设置background 盖住iframe的背景加载图*/
$('body').css('background','rgba(0,0,0,0)');
setTimeout(function () {
    $('body').css('background','#fff');
},2000);
// showLoading('页面加载中');
document.onreadystatechange = docReady;

function docReady() {
    switch (document.readyState) {
        case 'uninitialized':
            break;
        case 'loading':
            break;
        case 'interactive':
            break;
        case 'complete':
            $('body').css('background','#fff');
            break;
        default:
            break;
    }
}

function returnFloat(value){ 
    return parseFloat(value!=''&& !isNaN(value)?parseFloat(value).toFixed(2):0);
}


function getFirstAndEndDate(value) {
    var nowdays = !value||value==''?new Date():new Date(value.replace(/\-/g, "\/"));
    var year = nowdays.getFullYear();
    var month = nowdays.getMonth()+1;
    if (month < 10) {
        month = "0" + month;
    }
    console.log(month)
    var firstDay = year + "-" + month + "-" + "01";//上个月的第一天
    var myDate = new Date(year, month, 0);
    var lastDay = year + "-" + month + "-" + myDate.getDate();//上个月的最后一天

    return {firstDay:firstDay,lastDay:lastDay};
}

function unitRate(rates,nuit){

    var goods_rates = (rates).split(',');
    var unit_quantity = 1;
    for(var i =0 ;i<goods_rates.length;i++){
        console.log(goods_rates[i]);
        if (goods_rates[i].split('/')[1] == nuit) {
            unit_quantity =  goods_rates[i].split('/')[0];
            


            break;
        }
    }
    return parseFloat(unit_quantity);
}


function getDate(_closeDate) {
    var _closeDate = new Date(_closeDate.replace(/\-/g, "\/"));
    var nowDate = new Date(new Date().toLocaleDateString());

    var minDate = '0000-00-00';
    var month = _closeDate.getMonth() + 1;
    var year = _closeDate.getFullYear() ;
    var day = '01';
    if(nowDate >= _closeDate){

        if(month == 12){
            year = year + 1 ;
            month = 0 ;
        }
        month = month + 1;
        minDate = year + '-' + (month<10?('0'+month):month) + '-' + day;
    }else{

        minDate = year + '-' + (month<10?('0'+month):month) + '-' + day;
    }
    return minDate;

}




/**
 * @params: FileName:导出Excel的文件名称，excel:需要导出的table
 * 如果没有table列表，只有json数据的话，将json数据拼接成table字符串模板即可
 * **/
function exporExcel(FileName,e){
     
    var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>";
    excelFile += '<meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
    excelFile += '<meta http-equiv="content-type" content="application/vnd.ms-excel';
    excelFile += '; charset=UTF-8">';
    excelFile += "<head>";
    excelFile += "<!--[if gte mso 9]>";
    excelFile += "<xml>";
    excelFile += "<x:ExcelWorkbook>";
    excelFile += "<x:ExcelWorksheets>";
    excelFile += "<x:ExcelWorksheet>";
    excelFile += "<x:Name>";
    excelFile += "{worksheet}";
    excelFile += "</x:Name>";
    excelFile += "<x:WorksheetOptions>";
    excelFile += "<x:DisplayGridlines/>";
    excelFile += "</x:WorksheetOptions>";
    excelFile += "</x:ExcelWorksheet>";
    excelFile += "</x:ExcelWorksheets>";
    excelFile += "</x:ExcelWorkbook>";
    excelFile += "</xml>";
    excelFile += "<![endif]-->";
    excelFile += "</head>";
    excelFile += "<body>";
    excelFile += $(e).html();
    excelFile += "</body>";
    excelFile += "</html>";


    var uri = 'data:application/vnd.ms-excel;charset=utf-8,' + encodeURIComponent(excelFile);

    var link = document.createElement("a");
    link.href = uri;

    link.style = "visibility:hidden";
    link.download = FileName ;  //格式默认为.xls

    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}
