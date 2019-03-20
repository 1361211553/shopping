var ptypenameadd = null;
var saveBtn = null;
var backBtn = null;

$(function(){

    ptypenameadd = $("#ptypenameadd");
    saveBtn = $("#add");
    backBtn = $("#back");

    //初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
    ptypenameadd.next().html("*");

    /*
     * 验证
     * 失焦\获焦
     * jquery的方法传递
     */
    ptypenameadd.on("focus",function(){
        validateTip(ptypenameadd.next(),{"color":"#666666"},"* 请输入新的商品名称",false);
    }).on("blur",function(){
        $.ajax({
            type:"POST",
            url:path+"/sptype/validateSptype",
            data:{ptypename:ptypenameadd.val()},
            dataType:"json",
            success:function(data){
                if(ptypenameadd.val()!=null && ptypenameadd.val()!=""){
                    if(data == 0){
                        validateTip(ptypenameadd.next(),{"color":"green"},imgYes,true);
                    }else{
                        validateTip(ptypenameadd.next(),{"color":"red"},imgNo+" 该商品类别名称已存在",false);
                    }
				}else{
                    validateTip(ptypenameadd.next(),{"color":"red"},imgNo+" 输入不能为空",false);
				}

            },

        });
    });


    saveBtn.on("click",function(){
        ptypenameadd.blur();

        if(ptypenameadd.attr("validateStatus") == "true"){
            if(confirm("是否确认提交数据")){
                $("#providerForm").submit();
            }
        }
    });

    backBtn.on("click",function(){
        //alert("modify: "+referer);
        if(referer != undefined
            && null != referer
            && "" != referer
            && "null" != referer
            && referer.length > 4){
            window.location.href = referer;
        }else{
            history.back(-1);
        }
    });
});