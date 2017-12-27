<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>叩丁狼CRM管理系统</title>
    <%@include file="/static/common.jsp" %>
    <script type="text/javascript" src="/static/js/bill/check.js"></script>
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
<table id="check_datagrid"></table>
<div id="check_toolbar">
    <br/>承包公司:<select id="comId" name="comId" class="easyui-combobox"
                      style="width: 180px;"
                      panelHeight="auto"></select>&emsp;
    产品大类:<select id="productId2" name="proId2" class="easyui-combobox"
                 style="width: 180px;"
                 panelHeight="auto"></select>&emsp;
    产品:<select id="productId3" name="proId3" class="easyui-combobox"
               style="width: 180px;"
               panelHeight="auto"></select>
    <br/>
    <br/>
    起止时间:
    <td><input id="beginDate2" name="beginDate" class="easyui-datebox" style="width: 180px;"/>
        &emsp;&emsp;~ &nbsp;&emsp;&emsp;<input id="endDate2" name="endDate" class="easyui-datebox"
                                               style="width: 180px;"/></td>
    <br/>
    <br/>
    保单号码:<input id="odd2" name="odd" class="easyui-textbox" style="width: 180px"/>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    &emsp;&emsp;&emsp;&nbsp;车牌号码:
    <input id="Number" name="carNumber" class="easyui-textbox"
           panelHeight="auto" style=" width: 180px"/>
    <br/>
    <br/>
    投保人:&emsp;<input id="appId" name="appId" class="easyui-combobox" style="width: 180px"/>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    &emsp;&emsp;&emsp;&nbsp;身份证:&emsp;
    <input id="idNum" name="idNumber" class="easyui-textbox"
           panelHeight="auto" style=" width: 180px"/>
    <br/>
    <a class="easyui-linkbutton" iconCls="icon-remove" plain=true data-cmd="reload">刷新</a>
    <a class="easyui-linkbutton" iconCls="icon-edit" plain=true data-cmd="look">批改</a>
    <a class="easyui-linkbutton" iconCls="icon-search" plain=true data-cmd="searchS">搜索</a>
</div>
<div id="check_dialog">
    <form id="checkform" method="post">
        <div id="p" class="easyui-panel" data-options="fit:true">
            <div id="aa" class="easyui-accordion" data-options="fit:true,multiple:true,selected:false">
                <div id="accord6" title="批改信息" style="overflow:auto;padding:10px;"
                     data-options="multiple:true,selected:false">
                    <table style="margin-top: 15px;">
                        <%--拿到该批文id--%>
                        <input id="approval_id" type="hidden" name="approval.id" class="easyui-textbox"/>
                        <%--该保单id--%>
                        <input id="checkId" type="hidden" name="id" class="easyui-textbox"/>
                        <input id="approval_bill_id" type="hidden" name="approval.bill.id" class="easyui-textbox"/>
                        <!-- 拿到申请人id -->
                        <input id="applicant_id" type="hidden" name="approval.applicant.id" class="easyui-textbox"/>
                        <tr>
                            <td>申请单号：</td>
                            <td><input id="billId" class="easyui-textbox" readonly="readonly"/></td>
                        </tr>
                        <tr>
                            <td>批改原因：</td>
                            <td><input id="checkCause" name="approval.cause" class="easyui-textbox"/></td>
                        </tr>
                        <tr>
                            <td>批改期限：</td>
                            <td><input id="checkBiginDate" name="approval.checkbegindate" class="easyui-datebox"/>
                                ~<input id="checkEndDate" name="approval.checkenddate" class="easyui-datebox"/></td>
                        </tr>
                        <tr>
                            <!-- 申请人id -->
                            <td><input type="hidden" id="appUser_id" name="applicant.id" class="easyui-textbox"/></td>
                            <td>申请人：</td>
                            <td><input id="appUser" name="applicant.name" class="easyui-textbox"/></td>
                            <td>批改申请日期：</td>
                            <td><input id="checkAppDate" name="approval.checkappdate" class="easyui-datebox"/></td>
                        </tr>
                        <tr>
                            <td>批文：</td>
                            <td><input id="checkWord" name="approval.checkword" class="easyui-textbox"/></td>
                        </tr>
                        <tr>
                            <td>批改比较项：</td>
                            <td><input id="checkCompare" name="approval.checkcompare" class="easyui-textbox"/></td>
                        </tr>
                    </table>
                </div>
                <div id="accord1" title="投保人" style="overflow:auto;padding:10px;"
                     data-options="multiple:true,selected:false">
                    <table style="margin-top: 15px;">
                        <%--拿到投保人的id--%>
                        <%--<input id="applicantId" type="hidden" name="applicant.id" class="easyui-textbox"/>--%>
                        <%--该申请单id--%>
                        <input id="checkId" type="hidden" name="id" class="easyui-textbox"/>
                        <tr>
                            <td>名称：</td>
                            <td><input id="applicantName" name="applicant.name" class="easyui-textbox" value="1"/></td>
                            <br/>
                        </tr>
                        <tr>
                            <td>证件类型：</td>
                            <td><input name="papersType" class="easyui-textbox" disabled="disabled" value="身份证"/></td>
                            <td>证件号码：</td>
                            <td><input id="applicantIdCard" name="applicant.idCard" class="easyui-textbox"/></td>
                        </tr>
                        <tr>
                            <div data-toggle="distpicker">
                                <select id="eprovinceName" data-province="浙江省"></select>
                                <select id="ecityName" data-city="杭州市"></select>
                                <select id="edistrictName" data-district="西湖区"></select>
                            </div>
                        </tr>
                        <tr>
                            <td>补充地址：</td>
                            <td><input id="address" name="applicant.address" class="easyui-textbox"/></td>
                        </tr>
                        <tr>
                            <td>电话:</td>
                            <td><input id="applicantTel" name="applicant.tel" class="easyui-textbox"/></td>
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
                            <%--<td>证件类型：</td>--%>
                            <%--<td><input name="papersType" class="easyui-textbox"/></td>--%>
                            <td>证件号码：</td>
                            <td><input id="recognizeeIdCard" name="recognizee.idCard" class="easyui-textbox"/></td>
                        </tr>
                        <tr>
                            <%--<td>通讯地址地址：</td>--%>
                            <%--<td><input name="address" class="easyui-textbox"/></td>--%>
                            <td>电话:</td>
                            <td><input id="recognizeeTel" name="recognizee.idCard" class="easyui-textbox"/></td>
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
                            <td>单号：</td>
                            <td><input id="odd" name="basicBill.odd" class="easyui-textbox"/></td>
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
                            <td><select class="easyui-textbox" name="basicBill.payWay" id="payWay"
                                        data-options="panelHeight:'auto'">
                                <option value="0">现金</option>
                                <option value="1">微信</option>
                                <option value="2">支付宝</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>业务员：</td>
                            <td><input id="inputUser" name="basicBill.`inputUser.name" class="easyui-textbox"
                                       panelHeight="auto"/></td>
                            <input id="inputUserId" name="basicBill.inputUser.id" type="hidden" class="easyui-textbox"
                            />
                            <td>渠道：</td>
                            <td><input id="channel" name="basicBill.channel" class="easyui-textbox"/></td>
                        </tr>
                        <tr>
                            <td>特别约定：</td>
                            <td><input id="appoint" name="basicBill.appoint" class="easyui-textbox"
                                       panelHeight="auto"/></td>
                        </tr>
                    </table>
                </div>
                <div id="accord3" title="车辆信息" data-options="multiple:true,selected:false"
                     style="overflow:auto;padding:10px;">
                    <table>
                        <tr style="height: 40px;">
                            <td>品牌</td>
                            <td width="300px">
                                <%--拿到汽车的id--%>
                                <input id="carBrandId" type="hidden" name="car.carBrand.id" class="easyui-textbox"/>
                                <input id="carId" type="hidden" name="car.id" class="easyui-textbox"/>
                                <select id="carBrand" name="car.carBrand.name" class="easyui-textbox"
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
                                <select class="easyui-textbox" name="car.size" id="carSize" style="width:150px;"
                                        data-options="panelHeight:'auto'">
                                    <option value="0">小型</option>
                                    <option value="1">中型</option>
                                    <option value="2">大型</option>
                                    <option value="3">特大</option>
                                </select>
                            </td>
                            <td>车型</td>
                            <td>
                                <select class="easyui-textbox" name="car.type" id="carType" style="width:150px;"
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
                                <%--拿到公司id--%>
                                <input id="companyId" type="hidden" name="product.company.id" class="easyui-textbox"/>
                                <select id="companyName" name="product.company.name" class="easyui-textbox"
                                        style="width: 140px;"
                                        panelHeight="auto"></select>
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
                                <input id="productName" name="productName" class="easyui-textbox"/>
                            </td>
                            <td>保额:</td>
                            <td>
                                <input id="amount" class="easyui-textbox" class="easyui-textbox"/>
                            </td>
                            <td>保险年费:</td>
                            <td><input id="yearsAmount" name="product.yearsAmount" class="easyui-textbox"
                                       class="easyui-textbox"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>总计:
                                <input id="totalAmount" name="totalamount" class="easyui-textbox"/>
                            </td>
                            <td>元</td>
                        </tr>
                    </table>
                </div>
                <div style="margin:20px 0;"></div>
            </div>
        </div>

        <div id="emp_buttons">
            <a class="easyui-linkbutton" iconCls="icon-ok" plain="true" data-cmd="auditBill">提审</a>
            <a class="easyui-linkbutton" iconCls="icon-ok" plain="true" data-cmd="back">退回</a>
            <a class="easyui-linkbutton" iconCls="icon-ok" plain="true" data-cmd="cancel">关闭</a>
        </div>
    </form>
</div>
</body>
</html>
