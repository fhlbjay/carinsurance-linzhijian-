$(function () {
    var check_datagrid = $("#my_check");
    
    var dept_dialog = $("#dept_dialog");
    var dept_form = $("#dept_form");

    var onData = {
            sign:function(){
                $.get("/checkingin/sign.do",function(){

                    check_datagrid.datagrid("load");
                })
            },
            
            back:function(){
                $.get("/checkingin/back.do",function(){
                    check_datagrid.datagrid("load");
                })
        },
        
        updata:function(){
            $.get("/checkingin/updata.do",function(){
                check_datagrid.datagrid("load");
            })
    },
        changeState: function changeState() {
            var selected = dept_datagrid.datagrid("getSelected");
            if (selected) {
                $.post("/department/changeState.do", {id: selected.id}, function () {
                    dept_datagrid.datagrid("reload");
                });
            }
        }
    };

    $("[data-cmd]").click(function () {
        var cmd = $(this).data("cmd");
        onData[cmd]();
    });
    
    //页面显示数据
    check_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        url: '/checkingin/query.do',
        singleSelect: true,
        columns: [[
            {field: 'id', hidden: true},
            {field: 'empId', title: '姓名', width: 100,formatter: function (value, row, index) {
                return value ?value.username:"";}},
            {field: 'signtime', title: '签到时间', width: 100},
            {field: 'backtime', title: '签退时间', width: 100,formatter:function(value,row,index){
                
                if(value){
                   str = value.replace(/-/g,"/");
                   //2016/08/09 14:32:51
                   var date = new Date(str );
                   
                   var now = new Date(value.replace(/-/g,"/"));
                   //2016/08/09 14:32:51
                   now.setHours("8");
                  //2016/08/09 08:32:51
                   now.setMinutes("30");
                  //2016/08/09 08:30:51
                   now.setSeconds("0");
                   //2016/08/09 08:30:00
                   if(date>now){
                       return "<font color='red'>"+value+"</font>";
                   }else{
                       return "<font color='green'>"+value+"</font>";
                   }
                   
                }else{
                    return value;
                }}},
                {field: 'retime', title: '补签时间', width: 100},
            
            {
                field: 'status', title: '状态', width: 100, formatter: function (value, row, index) {
                console.log(value);
                    return value == 0 ? "正常" : "<font color='red'>异常</font>";
                }
            }
        ]],
        toolbar: '#check_toolbar',
        striped: true,
        pagination: true,
        rownumbers: true,
    });

});
