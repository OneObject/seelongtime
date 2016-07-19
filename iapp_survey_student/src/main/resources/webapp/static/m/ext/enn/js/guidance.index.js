

/* begin 初始化各模块 */



function initWrapperBox3() {

}

function initWrapperBox4() {
    var $percentList = $('#new-student-list .percent');
    var $helpBtn = $('#help-btn');
    var $tempPercent;
    var tempPercentWidth;
    for (var i = 0; i < $percentList.length; i++) {
        $tempPercent = $($percentList[i]);
        tempPercentWidth = $tempPercent.data('percent');
        +(function ($tempPercent, tempPercentWidth) {
            setTimeout(function () {
                $tempPercent.css('width', tempPercentWidth + '%');
            }, 300);
        }($tempPercent, tempPercentWidth));
    }
    $helpBtn.bind('click', function () {
        window.location.href = '#';
    });
}

function initWrapperBox5() {

}
/* end 初始化各模块 */



