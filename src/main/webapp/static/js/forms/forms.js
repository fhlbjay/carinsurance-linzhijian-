$(function () {

    //抽取变量(目录)
    var forms_datagrid = $("#forms_datagrid");

    //初始化 目录datagrid
    forms_datagrid.datagrid({
        fit: true,
        fitColumns: true,
        striped: true,
        url: "/chart/list.do",
        pagination: true,
        singleSelect: true,
        toolbar: "#forms_toolbar",
        rownumbers:true,
        columns: [[
            {field: 'groupType', title: '分组类型', width: 180, align: 'center'},
            {field: 'totalCount', title: '潜在客户', width: 180, align: 'center'}
        ]]
    });
});

function doSearch(){
    var beginDate = $("#beginDate").val();
    var endDate = $("#endDate").val();
    var groupType = $("#groupType").val();
    $("#forms_datagrid").datagrid("load",{
        beginDate:beginDate,
        endDate:endDate,
        groupType:groupType
    });

}

