/**
 * Created by hzj on 2017/9/19.
 */

/*内容加载完成时 设置background 盖住iframe的背景加载图*/
$('body').css('background','rgba(0,0,0,0)');
setTimeout(function () {
    $('body').css('background','#fff');
},1100);


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
