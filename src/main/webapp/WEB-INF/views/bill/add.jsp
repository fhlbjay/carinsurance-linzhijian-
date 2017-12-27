<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/bill/add.js"></script>
    <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
    <script src="/static/plugin/distpicker/js/distpicker.data.js"></script>
    <script src="/static/plugin/distpicker/js/distpicker.js"></script>
    <script src="/static/plugin/distpicker/js/main.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#distpicker").distpicker('destroy');
            $("#distpicker").distpicker({
                province: '省份名',
                city: '城市名',
                district: '区名',
                autoSelect: true,
                placeholder: false
            });
            console.log($("#eprovinceName").val() + $("#ecityName").val() + $("#edistrictName").val());
        });
    </script>
</head>
<body>
<table id="add_datagrid"></table>
<div id="add_toolbar">
    <a class="easyui-linkbutton" iconCls="icon-save" plain=true data-cmd="save">暂存</a>
    <a id="changeBtn" class="easyui-linkbutton" iconCls="icon-remove" plain=true data-cmd="check">申请批改</a>
</div>

<form id="form" method="post">
    <div id="p" class="easyui-panel">
        <div id="aa" class="easyui-accordion">
            <div id="accord1" title="投保人"
                 data-options="multiple:true,selected:false">
                <table style="margin-top: 15px;">
                    <%--拿到投保人的id--%>
                    <input id="applicantId" type="hidden" name="applicant.id" class="easyui-textbox"/>
                    <tr>
                        <td>名称：</td>
                        <td><input id="applicantName" name="applicant.name" class="easyui-textbox"/></td>
                        <br/>
                    </tr>
                    <tr>
                        <td>证件类型：</td>
                        <td><input class="easyui-textbox" readonly="readonly" value="居民身份证"/></td>
                    </tr>
                    <tr>
                        <td>证件号码：</td>
                        <td><input id="applicantIdCard" name="applicant.idCard" class="easyui-textbox"/></td>
                    </tr>
                    <tr>
                        <td>地址:</td>
                        <td>
                            <div data-toggle="distpicker">
                                <select id="eprovinceName" data-province="浙江省"></select>
                                <select id="ecityName" data-city="杭州市"></select>
                                <select id="edistrictName" data-district="西湖区"></select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>补充地址：</td>
                        <td><input id="address" name="applicant.address" class="easyui-textbox"/></td>
                    </tr>
                    <tr>
                        <td>电话:</td>
                        <td><input id="applicantTel" name="applicant.tel" class="easyui-textbox"/></td>
                    </tr>
                    <tr salign='right'>
                        <td>
                            <a class="easyui-linkbutton"
                               data-options="iconCls:'icon-search'" data-cmd="choose_customer">会员客户</a>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="accord2" title="被投保人" style="overflow:auto;padding:10px;"
                 data-options="multiple:true,selected:false">
                <table style="margin-top: 15px;">
                    <%--拿到被投保人的id--%>
                    <input id="recognizeeId" type="hidden" name="recognizee.id" class="easyui-textbox"/>
                    <tr>
                        <td>名称：</td>
                        <td><input id="recognizeeName" name="recognizee.name" class="easyui-textbox"/></td>
                        <br/>
                    </tr>
                    <tr>
                        <td>证件类型：</td>
                        <td><input class="easyui-textbox" readonly="readonly" value="居民身份证"/></td>
                        <td>证件号码：</td>
                        <td><input id="recognizeeIdCard" name="recognizee.idCard" class="easyui-textbox"/></td>
                    </tr>
                    <tr>
                        <%--<td>通讯地址地址：</td>--%>
                        <%--<td><input name="address" class="easyui-textbox"/></td>--%>
                        <td>电话:</td>
                        <td><input id="recognizeeTel" name="recognizee.idCard" class="easyui-textbox"/></td>
                    </tr>
                    <tr>
                        <td>
                        <a class="easyui-linkbutton"
                           data-options="iconCls:'icon-search'" data-cmd="choose_customer2">会员客户</a>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="accord5" title="基本信息" style="overflow:auto;"
                 data-options="multiple:true,selected:false">
                <table>
                    <tr>
                        <td>申请日期：</td>
                        <td><input id="applyDate" name="basicBill.inputDate" class="easyui-datebox"/></td>
                    </tr>
                    <tr>
                        <td>保险起止期：</td>
                        <td><input id="beginDate" name="basicBill.beginDate" class="easyui-datebox"/>
                            ~<input id="endDate" name="basicBill.endDate" class="easyui-datebox"/></td>
                        &nbsp;<td>共<font id="days">365</font>天</td>
                    </tr>
                    <tr>
                        <td>争议处理：</td>
                        <td><input id="handle" name="basicBill.handle" class="easyui-textbox"/></td>
                        <td>仲裁名称：</td>
                        <td><input id="arbitrament" name="basicBill.arbitrament" class="easyui-textbox"/></td>
                        <br/>
                    </tr>
                    <tr>
                        <td>业务来源：</td>
                        <td><input id="businessSource" name="basicBill.businessSource" class="easyui-textbox"/></td>
                        <td>缴费方式：</td>
                        <td><select class="easyui-combobox" name="basicBill.payWay" id="payWay"
                                    data-options="panelHeight:'auto'">
                            <option value="0">现金</option>
                            <option value="1">微信</option>
                            <option value="2">支付宝</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>业务员：</td>
                        <td><input id="inputUser" name="basicBill.inputUser.id" class="easyui-combobox"
                                   panelHeight="auto"/></td>
                        <td>渠道：</td>
                        <td><input id="channel" name="basicBill.channel" class="easyui-textbox"/></td>
                    </tr>
                    <tr>
                        <td>特别约定：</td>
                        <td><input id="appoint" name="basicBill.appoint" class="easyui-combobox" panelHeight="auto"/>
                        </td>
                    </tr>
                </table>
            </div>

            <div id="accord3" title="车辆信息" data-options="multiple:true,selected:false"
                 style="overflow:auto;padding:10px;">
                <table>
                    <tr style="height: 40px;">
                        <td>品牌</td>
                        <td width="300px">
                            <select id="carBrand" name="car.carBrand.id" class="easyui-combobox"
                                    style="width: 70px;"
                                    panelHeight="auto"></select>
                        </td>
                        <td>车牌号码</td>
                        <td>
                            <input id="carplateNumber" name="car.carNumber" class="easyui-textbox"
                                   panelHeight="auto" style=" width: 150px"/>
                        </td>
                        <td>估价</td>
                        <td>
                            <input id="valuation" name="car.valuation" class="easyui-textbox"
                                   style=" width: 150px"/>
                        </td>
                    </tr>
                    <tr style="height: 40px;">

                        <td>规格</td>
                        <td>
                            <select class="easyui-combobox" name="car.size" id="carSize" style="width:150px;"
                                    data-options="panelHeight:'auto'">
                                <option value="0">小型</option>
                                <option value="1">中型</option>
                                <option value="2">大型</option>
                                <option value="3">特大</option>
                            </select>
                        </td>
                        <td>车型</td>
                        <td>
                            <select class="easyui-combobox" name="car.type" id="carType" style="width:150px;"
                                    data-options="panelHeight:'auto'">
                                <option value="0">载人</option>
                                <option value="1">载货</option>
                                <option value="2">危险</option>
                                <option value="3">特殊</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <div id="accord4" title="保险产品" data-options="multiple:true,selected:false" style="padding:10px;">
                <table>
                    <tr>
                        <td>承包公司：</td>
                        <td>
                            <select id="company" name="product.company.id" class="easyui-combobox"
                                    style="width: 140px;"
                                    panelHeight="auto"></select>
                            <a class="easyui-linkbutton" data-options="iconCls:'icon-xinzeng'" data-cmd="add_product">添加产品</a>
                        </td>
                        <td>时长:</td>
                        <td>
                            <%--拿到商品id--%>
                            <input id="productId" type="hidden" name="product.id" class="easyui-textbox"/>
                            <input name="product.years" style="width: 40px;" id="duration"
                                   class="easyui-textbox"
                            />年&nbsp;
                            费率:<input style="width: 40px;" id="rate" class="easyui-textbox"
                        />
                        </td>
                    </tr>
                    <tr id="hidethis" class="product-tr" data-oid="-1">
                        <td>保险产品:</td>
                        <td>
                            <input id="productName" class="easyui-textbox"/>
                        </td>
                        <td>保额:</td>
                        <td>
                            <input id="amount" name="product.amount" class="easyui-textbox" class="easyui-textbox"/>
                        </td>
                        <td>保险年费:</td>
                        <td><input id="yearsAmount" name="product.yearsAmount" class="easyui-textbox" class="easyui-textbox"/></td>
                        <td><a class="easyui-linkbutton"
                               data-options="iconCls:'icon-edit',plain:'true'" onclick="delete_this(this);"></a>
                        <td><a class="easyui-linkbutton"
                               data-options="iconCls:'icon-ok',plain:'true'" data-cmd="insurance"></a></td>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>总计:
                            <input id="totalAmount2" name="totalamount" width="50" class="easyui-textbox"/>
                        </td>
                        <td>元</td>
                    </tr>
                </table>
            </div>
            <div style="margin:20px 0;"></div>
        </div>
    </div>
    <div id="choose_product_dialog">
        <table id="product_datagrid"></table>
    </div>
    <div id="choose_customer_dialog">
        <table id="customer_datagrid"></table>
    </div>
    <div id="choose_recognizee_dialog">
        <table id="recognizee_datagrid"></table>
    </div>
    <div id="customer_btns">
        <a class="easyui-linkbutton" iconCls="icon-ok" plain="true" data-cmd="select_applicant">确定</a>
    </div>
    <div id="customer_btns2">
        <a class="easyui-linkbutton" iconCls="icon-ok" plain="true" data-cmd="select_recognizee">确定</a>
    </div>
    <div id="product_btns2">
        <a class="easyui-linkbutton" iconCls="icon-ok" plain="true" data-cmd="select_product">确定</a>
    </div>
    <div id="insurance__btns">
        <a class="easyui-linkbutton" iconCls="icon-ok" plain="true" data-cmd="count">计算保费</a>
        <a class="easyui-linkbutton" iconCls="icon-ok" plain="true" data-cmd="cancel">取消</a>
    </div>
</form>
<div id="insurance_dialog">
    <form id="insuranceForm">
        <table>
            <!-- 当前bill的id -->
            <input type="hidden" id="bill_id" name="bill.id" class="easyui-textbox"/>
            上一年交通事故次数:<input name="taxAndIns.trafficNumber" id="trafficNumber"
                             class="easyui-numberspinner"
                             data-options="required:true,min:0"/><br/>
            上一年酒驾事故次数:<input name="taxAndIns.drunkNumber" id="drunkNumber"
                             class="easyui-numberspinner"
                             data-options="required:true,min:0"/><br/>
            未出事故年数:<input name="taxAndIns.safeYears" id="safeYears"
                          class="easyui-numberspinner"
                          data-options="required:true,min:0"/><br/>
            车船税: <input id="tax" class="easyui-textbox" name="taxAndIns.tax"
                        panelHeight="auto" style=" width: 150px"/><br/>
            交强险: <input id="ins" class="easyui-textbox" name="taxAndIns.ins"
                        panelHeight="auto" style=" width: 150px"/><br/><br/>
            交强险系数: <input id="insModulus" name="taxAndIns.insModulus" class="easyui-textbox"
                          panelHeight="auto" style=" width: 150px"/>
        </table>
    </form>
</div>
</body>
</html>
