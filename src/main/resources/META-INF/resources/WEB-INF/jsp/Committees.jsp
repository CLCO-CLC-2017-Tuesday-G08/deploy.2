<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>
	WELCOME TO ICSSE 2017
</title>
<link href="/resources/CSS/show_img.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/resources/Portlets/PanelBar/js/jquery-1.7.2.min.js"></script>
    <script src="/resources/Scripts/Common.js" type="text/javascript"></script>
    <script src="/resources/Scripts/PagingContent.js" type="text/javascript"></script>
<link rel="shortcut icon" type="image/png" href="/resources/Resources/Imagephoto/logo.png" />
<link href="/resources/Components/lightbox/css/lightbox.css" rel="stylesheet" type="text/css" />
    <script src="/resources/Components/lightbox/js/lightbox.min.js" type="text/javascript"></script>
    <link href="/resources/CSS/search_Article.css" rel="stylesheet" />
    <script language="javascript" type="text/javascript">
        function SearchProcess(event) {
            if (event.keyCode == 13) {
                OnSearch(document.getElementById('txtSearchArticle').value);
                return false;
            }
            return true;
        }
        function OnSearch(query) {
            PSCPortal.Services.CMS.SearchAndPaging(query, currentPage, OnSearchSuccess, OnSearchFailed);
        }

        function OnSearchSuccess(results, context, methodName) {
            var position = results.indexOf('_');
            totalRecords = results.substring(0, position);
            results = results.substring(position + 1);
            LoadContentAndPaging(results);
        }
        function OnSearchFailed(results, context, methodName) {
        }

        function retitleUrl(str) {
            str = str.replace(/^\s+|\s+$/g, ''); // trim
            str = str.toLowerCase();
            // remove accents, swap ñ for n, etc
            var from = "àáảãạăằắẳẵặâầấẩẫậđèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵ·/_,:;";
            var to = "aaaaaaaaaaaaaaaaadeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyy------";
            for (var i = 0, l = from.length ; i < l ; i++) {
                str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
            }
            str = str.replace(/[^a-z0-9 -]/g, '') // remove invalid chars
              .replace(/\s+/g, '-') // collapse whitespace and replace by -
              .replace(/-+/g, '-'); // collapse dashes
            return str;
        };

        function popunder() {
            $('a').not('[href^="http"],[href^="https"],[href^="mailto:"],[href^="#"]').each(function () {
                $(this).attr('href', function (index, value) {
                    if (value != undefined) {
                        var index = value.indexOf("Default.aspx");
                        if (index >= 0)
                            return value = "/" + value.substring(index, value.length);
                    }
                });
            });
            var articleId = '' != '' ? '' : '';
            var topicId = '' != '' ? '' : '';
            var moduleId = '' != '' ? '' : '';
            if (articleId != '') {
                if (window.history.state == null) {
                    if (articleId.indexOf("index.html") > -1)
                        articleId = articleId.substr(0, articleId.indexOf("index.html"));
                    window.history.replaceState({ ArticleId: articleId }, "ArticleId", "/ArticleId/" + articleId + "/" + retitleUrl(''));
                }
            }
            if (topicId != '') {
                if (window.history.state == null) {
                    if (topicId.indexOf("index.html") > -1)
                        topicId = topicId.substr(0, topicId.indexOf("index.html"));
                    window.history.replaceState({ TopicId: topicId }, "TopicId", "/TopicId/" + topicId + "/" + retitleUrl(''));
                }
            }
            
        }
    </script>


<link href="WebResource35b9.css?d=QGz0EVx6KnXd0XFNz6_h8xNXGaTBbw0tdFlEudQ7cm-OthWnn6Dm_5tU0MRnaGIhZBbRg9S7WqTpHMZa1xNtEI0ab6Kl1IPnRi5TjbKoJFbytbX9TFl44EGYy--GyfelKV3DXQ2&amp;t=636040235083572431" type="text/css" rel="stylesheet" class="Telerik_stylesheet" />
<link href="WebResourceb3b4.css?d=x4growm4tE1xfqgq7CUmVsUnI-CbXa2N-c2_fNRwnEpvDP0BV-wXVIwtg-UArpbb2CDL-uqyWHg0pIMI2IqW_DG9HsBwwwsOkPeV5QgKyY9Yh5O4O982ECGyV1iNUPf_9TfsdN6N5kUDZgz-JeRM7Yx1qwU1&amp;t=636040235083572431" type="text/css" rel="stylesheet" class="Telerik_stylesheet" />
<link href="WebResourcee0ee.css?d=ytD-yNU6w7OB5aQbpzdcKJJ4smWyZMrK26w2o8npDQvDJ2icAgnw46NhWNMATnygLURPdF6r1twj4HqvCpovy2cbE23Jpa5bO0SD9RAs5_bYKKb1dSU8kaK__zLNU1OzkJIV0Q2&amp;t=636040235083572431" type="text/css" rel="stylesheet" class="Telerik_stylesheet" />
</head>
<t:template>
    <jsp:attribute name="header">
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
   
<script type="text/javascript">

    $(document).ready(function () {

        $(".slidingDiv").hide();
        $(".show_hide").show();

        $('.show_hide').click(function () {
            $(".slidingDiv").slideToggle();
        });

    });

</script>
<style type="text/css">
    .bg_display {
        clear: both;
        float: left;
        background: #fff;
    }

    .title_display {
        color: #9F0E13;
        font-weight: bold;
        font-size: 14px;
        text-transform: uppercase;
        border-bottom: 1px dashed #0280bb;
        padding: 5px 0px 5px 10px;
        margin: 0px 10px;
    }

        .title_display a {
            color: #333 !important;
        }

            .title_display a:hover {
                color: #FF0000 !important;
            }

    .ct_tin_display {
        float: left;
        width: 670px;
        padding-bottom: 15px;
    }

    .articleTitle a {
        margin: 0px 5px 0px 5px;
        margin-bottom: 10px;
        color: #0280BB;
        font-weight: bold;
        font-size: 16px;
    }

    .articleDescription p {
        font: 13px Arial;
        color: #000;
        line-height: 20px;
        margin: 0px 5px 0px 5px;
    }


    .articleContent {
        font: 13px Arial;
        line-height: 150%;
        text-align: justify;
        margin: 0px 5px 0px 5px;
    }

        .articleContent ol, .articleContent ul {
            padding-left: 40px;
        }

        .articleContent a, .articleContent p, .articleContent span, .articleContent h1, .articleContent h2,
        .articleContent h3, .articleContent h4, .articleContent h5, .articleContent h6,
        .articleContent div, .articleContent ul, .articleContent li, .articleContent table,
        .articleContent th, .articleContent tr, .articleContent td {
            font-family: Arial;
            font-size: 13px;
            text-align: justify;
            line-height: 150%;
        }

    .tinkhac_display {
        float: left;
        width: 670px;
        margin: 0px 5px 0px 25px;
        list-style-image: url(Resources/ImagesPortal/HomePage/arrow.png);
    }

        .tinkhac_display a {
            font: 13px Arial;
            line-height: 20px;
            color: #333;
        }

            .tinkhac_display a:hover {
                color: #FF0000;
            }
</style>

<div class="bg_display">
    <div class="display" style="float: left; width: 100%;">
        <div class="title_display">
             <a style='color:#666;' href=index032f.html?TopicId=8fdb6e21-307c-4046-94ab-bd311a2a9930>committees </a> 
        </div>
        <div style="margin-top: 10px;">
            <div style="margin-left: 5px; margin-bottom: 10px;">
                <div class="ct_tin_display">
                    <div class="articleTitle">
                        <a href="index816d.html?ArticleId=dd21088d-cb55-4f9d-ac9c-73553c715cae"></a>
                    </div>
                    <div style="float:left;width: 100%; margin: 5px 5px 5px 10px;display: none;" >
                        <span style="font-weight: bold;font-style: italic">TÃ¡c giáº£ </span>:
                    </div>
                   
                    <div class="articleContent">
                        <span style="font-family: &quot;times new roman&quot;; font-size: 14px;"><strong><span style="font-size: 14px; color: #c00000;"><br />
<br />
<span style="font-size: 14px;">
Honorary General Chairs:</span></span></strong><span style="font-size: 14px;"><span style="font-size: 14px;"><br />
<span style="font-size: 14px; color: #002060;"><span style="font-size: 14px; color: #002060;">Do Van Dung, HCMUTE, Vietnam<br />
</span>Tsu-Tian Lee, Tamkang University, Taiwan</span><br />
</span><br />
</span>
</span>
<table>
    <tbody>
        <tr>
            <td style="width: 250px;"><span style="font-size: 14px; font-family: &quot;times new roman&quot;;"><span style="font-size: 14px; color: #002060;"><strong style="font-size: 14px;"><span style="font-size: 14px; color: #c00000;">General Chairs:</span></strong><br />
            </span><span style="font-size: 14px;"><span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;"><span style="font-size: 14px; text-align: start; color: #002060;">Yo-Ping Huang, NTUT, Taiwan</span><br />
            </span><span style="font-size: 14px; text-align: start; color: #002060;">Ngo Van Thuyen, HCMUTE, Vietnam</span></span><br />
            </span></td>
            <td style="width: 50px;"><span style="font-size: 14px; font-family: &quot;times new roman&quot;;">&nbsp;</span></td>
            <td><span style="font-size: 14px; font-family: &quot;times new roman&quot;;"><span style="font-size: 14px; color: #002060;"><span style="font-size: 14px; text-align: start; line-height: normal; color: #002060;"><strong style="color: #002060; font-size: 14px; text-align: start;"><span style="font-size: 14px; color: #c00000;">Co-General Chairs:<br />
            </span></strong><span style="font-size: 14px;">Shun-Feng Su, NTUST, Tai</span></span><span style="font-size: 14px;"><span style="font-size: 14px; text-align: start; line-height: normal; color: #002060;">wan</span><br />
            Wen-June Wang, NCU, Taiwan</span></span><br />
            </span></td>
        </tr>
    </tbody>
</table>
<span style="font-family: &quot;times new roman&quot;; font-size: 14px;"><span style="font-size: 14px;"><strong><span style="font-size: 14px; color: #c00000;"><br />
</span></strong>
<table>
    <tbody>
        <tr>
            <td style="width: 250px;"><span style="font-size: 14px;"><span style="font-size: 14px; color: #002060;"></span><strong style="font-size: 14px;"><span style="font-size: 14px; color: #c00000;">Steering Committee:<br />
            </span></strong><span style="font-size: 14px; color: #002060;">Philip Chen, UM, Macau<br />
            Jyh-Horng Chou, NKUAS, Taiwan<br />
            Ngo Van Thuyen, HCMUTE, Vietnam<br />
            Le Hieu Giang, HCMUTE, Vietnam<br />
            Keith Hipel, UWaterloo, Canada</span></span><span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;"></span></td>
            <td style="width: 50px;">&nbsp;</td>
            <td><span style="font-size: 14px; color: #002060;"><span style="font-size: 14px;"></span>Hoang An Quoc, HCMUTE, Vietnam<br />
            Imre J.Rudas, &Oacute;Buda University, Hungary<br />
            Nguyen Minh Tam, HCMUTE, Vietnam<br />
            <p style="margin: 1pt 0cm; text-align: left;"><span style="font-size: 14px;">Ljiljana Trajkovic, SFU, Canada</span></p>
            Wei-Yen Wang, NTNU, Taiwan<br />
            Mengchu Zhou, NJIT, USA</span><span style="font-size: 14px; color: #002060;"></span></td>
        </tr>
    </tbody>
</table>
<strong><span style="font-size: 14px; color: #c00000;"><br />
</span></strong>
<table>
    <tbody>
        <tr>
            <td style="width: 250px;"><span style="font-size: 14px; color: #002060;"><strong style="font-size: 14px;"><span style="font-size: 14px; color: #c00000;">Technical Program Chairs:<br />
            </span></strong><span style="font-size: 14px; line-height: normal; text-align: left; color: #002060;">Vo Minh Huan, HCMUTE,&nbsp;</span><span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Vietnam<br />
            <span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Le Chi Kien, HCMUTE,&nbsp;Vietnam</span><span style="line-height: normal; font-size: 14px; text-align: start; color: #002060;">&nbsp;</span></span></span><br />
            </td>
            <td style="width: 50px;">&nbsp;</td>
            <td style="text-align: left; vertical-align: top;"><span style="font-size: 14px; color: #002060;"><span style="font-size: 14px; line-height: normal; text-align: start;"><span style="line-height: normal; text-align: start; font-size: 14px; color: #002060;"><strong style="color: #002060; font-size: 14px; text-align: start;"><span style="font-size: 14px; color: #c00000;">Technical Program Co-Chairs:</span></strong><br />
            <span style="font-size: 14px;">
            Nguyen Vu Lan, HCMUTE,&nbsp;<span style="font-size: 14px; color: #002060;">Vietnam</span></span></span><span style="font-size: 14px;"><br />
            </span></span><span style="font-size: 14px;">Truong Dinh Nhon, HCMUTE,<span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Vietnam<br />
            Huynh Phuoc Son, HCMUTE, Vietnam<br />
            Nguyen Truong Thinh,&nbsp;<span style="font-size: 14px; text-align: start; color: #002060;">HCMUTE, Vietnam</span><br />
            </span></span></span><span style="font-size: 14px;"><span style="line-height: normal; text-align: start; font-size: 14px; color: #002060;">Do Thanh Trung, HCMUTE,</span><span style="line-height: normal; text-align: start; font-size: 14px; color: #002060;">Vietnam</span></span><br />
            </td>
        </tr>
    </tbody>
</table>
<br />
<table>
    <tbody>
        <tr>
            <td style="width: 250px;"><span style="font-size: 14px; color: #c00000;"><strong>General secretary:&nbsp;</strong></span><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;"><span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Nguyen Vu Lan, HCMUTE,&nbsp;</span><span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Vietnam<br />
            </span>Hoang An Quoc, HCMUTE, <span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Vietnam</span></span><br />
            </td>
            <td style="width: 50px;">&nbsp;</td>
            <td><span style="font-size: 14px; color: #c00000;"><strong>Special Session Chairs:</strong></span><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;">Pei-Jun Lee, NCNU, Taiwan</span><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;">Ching-Chih Tsai, NCHU, Taiwan</span></td>
        </tr>
    </tbody>
</table>
<br />
</span>
<table>
    <tbody>
        <tr>
            <td style="width: 250px;"><strong style="font-size: 14px;"><span style="font-size: 14px; color: #c00000;">Publicity Chairs:<br />
            </span></strong><span style="font-size: 14px; color: #002060;">Kao-Shing Hwang, NSYSU, Taiwan</span></td>
            <td style="width: 50px;">&nbsp;</td>
            <td><strong style="font-size: 14px;"><span style="font-size: 14px; color: #c00000;">Award Chairs:</span></strong><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;">Bing-Fei Wu, NCTU, Taiwan</span></td>
        </tr>
    </tbody>
</table>
<br />
<table>
    <tbody>
        <tr>
            <td style="width: 250px;"><strong style="font-size: 14px;"><span style="font-size: 14px; color: #c00000;">Registration Chairs:</span></strong><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;">Mei-Yun Chen, NTNU, Taiwan</span><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;">Do Thanh Trung, HCMUTE,</span><span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Vietnam</span></td>
            <td style="width: 50px;">&nbsp;</td>
            <td><strong style="font-size: 14px;"><span style="font-size: 14px; color: #c00000;">Local Arrangement Chairs:</span></strong><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;">Nguyen Vu Lan, HCMUTE, <span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Vietnam</span></span><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;">Do Thanh Trung, HCMUTE, </span><span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Vietnam</span></td>
        </tr>
    </tbody>
</table>
<br />
<span style="font-size: 14px; color: #002060;">
<table>
    <tbody>
        <tr>
            <td style="width: 250px;"><strong style="font-size: 14px;"><span style="font-size: 14px; color: #c00000;">Publications Chairs:</span></strong><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;">Chen-Chien Hsu, NTNU, Taiwan<br />
            </span></td>
            <td style="width: 50px;">&nbsp;</td>
            <td><span style="font-size: 14px; color: #c00000;"><strong>Web Chairs:</strong></span><br style="font-size: 14px;" />
            <span style="font-size: 14px; color: #002060;">Chau Ngoc Thin, HCMUTE, <span style="font-size: 14px; line-height: normal; text-align: start; color: #002060;">Vietnam</span></span>&nbsp;</td>
        </tr>
    </tbody>
</table>
</span>
</span>
<div><span style="font-size: 14px; font-family: &quot;times new roman&quot;; color: #002060;"><br />
</span></div>
<div id="radePasteHelper" style="position: absolute; left: -10000px; border: 0px solid red; top: 226px; width: 1px; height: 1px; overflow: hidden;">
<table>
    <tbody>
        <tr>
            <td style="vertical-align: top;"><span style="font-size: 14px; font-family: &quot;times new roman&quot;; color: #002060;">Do Thanh Trung, HCMUTE,&nbsp;<span style="font-size: 14px; color: #002060;">Vietnam</span></span></td>
        </tr>
    </tbody>
</table>
</div>
                    </div>
                </div>
                                            
            </div>
            <div style="margin-left: 5px">
                <img style="float: left;" src="/resources/Resources/ImagesPortal/HomePage/tinkhac.png" />
                <a style="color: #0280BB; text-transform: uppercase; font: 13px Verdana; float: left; margin-left: 10px; font-weight: bold;"
                    href="#">Others</a>
            </div>
            <div style="float: left; width: 670px; margin-bottom: 10px; padding-top: 5px; clear: both; margin: 0px 5px 0px 5px;">
                
            </div>

        </div>
    </div>
    <div id="ctl06_ctl01_ValidationSummary1" style="color:Red;display:none;">

				</div>
    
    <div style="margin-top: 10px; margin-right: 25px; margin-left: 20px; text-align: justify; float: left; margin-bottom: 10px; display: none;">
        <div style="float: left; width: 100%;">
            <div style="background: url(Resources/ImagesPortal/HomePage/guigopy.png) no-repeat; width: 76px; height: 24px; float: left;">
                <div style="font-weight: bold; font: 13px Verdana; color: #fff; padding-top: 3px; text-align: center;"
                    class="show_hide">
                    Comments
                </div>
            </div>
        </div>
        <div style="font-family: Verdana; font-size: small; color: #FF0000; float: left; width: 100%;">
            
        </div>

        <div class="slidingDiv" style="float: left;">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td align="right" style="font-family: Verdana; font-size: 11px; color: #333; font-weight: bold; padding: 5px"
                        width="80px">
                        Full Name:
                    </td>
                    <td align="left" style="width: 230px;">
                        <input name="ctl06$ctl01$txtFullName" type="text" id="ctl06_ctl01_txtFullName" style="width:200px;" />
                        <span style="color: Red">*</span><span id="ctl06_ctl01_RequiredFieldValidator1" title="Required" style="color:Red;display:none;"></span>
                    </td>
                    <td align="left">&nbsp;
                
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-family: Verdana; color: #333; font-size: 11px; font-weight: bold; padding: 5px"
                        width="80px">Email:
                    </td>
                    <td align="left" style="width: 230px;">
                        <input name="ctl06$ctl01$txtEmail" type="text" id="ctl06_ctl01_txtEmail" style="width:200px;" />
                        <span style="color: Red">*</span><span id="ctl06_ctl01_RequiredFieldValidator3" title="Required" style="color:Red;display:none;"></span>
                        <span id="ctl06_ctl01_RegularExpressionValidator3" title="Invalid Email" style="color:Red;display:none;"></span>
                    </td>
                    <td align="left">&nbsp;
                
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-family: Verdana; font-size: 11px; color: #333; font-weight: bold; padding: 5px"
                        width="80px">
                        Title:
                    </td>
                    <td align="left" style="width: 230px;">
                        <input name="ctl06$ctl01$txtTitle" type="text" id="ctl06_ctl01_txtTitle" style="width:200px;" />
                        <span style="color: Red">*</span><span id="ctl06_ctl01_RequiredFieldValidator4" title="Required" style="color:Red;display:none;"></span>
                    </td>
                    <td align="left">&nbsp;
                
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-family: Verdana; font-size: 11px; color: #333; font-weight: bold; padding: 5px"
                        width="80px">
                        Captcha:
                    </td>
                    <td align="left" style="width: 250px;">
                        <div id="ctl06_ctl01_RadCaptcha1" class="RadCaptcha RadCaptcha_Default" style="float: left;">
					<span id="ctl06_ctl01_RadCaptcha1_ctl00" style="color:Red;visibility:hidden;"></span><div id="ctl06_ctl01_RadCaptcha1_SpamProtectorPanel">
						<img id="ctl06_ctl01_RadCaptcha1_CaptchaImage" alt="" src="Telerik.Web.UI.WebResource8b7b.jpg?type=rca&amp;guid=e488d2f9-e129-4a61-b3fa-59faeebce6a9" style="height:50px;width:150px;border-width:0px;display:block;" />
					</div><input id="ctl06_ctl01_RadCaptcha1_ClientState" name="ctl06_ctl01_RadCaptcha1_ClientState" type="hidden" />
				</div>
                        <input name="ctl06$ctl01$txtCapCha" type="text" id="ctl06_ctl01_txtCapCha" style="width:204px;" />
                        <span id="ctl06_ctl01_RequiredFieldValidator6" title="Invalid Code" style="color:Red;visibility:hidden;">(*)</span>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-family: Verdana; font-size: 11px; font-weight: bold; color: #fff; padding: 5px"
                        colspan="3">
                        <div id="ctl06_ctl01_fckContent" class="RadEditor Default reWrapper" style="height:210px;width:380px;float: left;">
					<div id="ctl06_ctl01_fckContent_dialogOpener" style="display:none;">
						<div id="ctl06_ctl01_fckContent_dialogOpener_Window" style="display:none;">
							<div id="ctl06_ctl01_fckContent_dialogOpener_Window_C">

							</div><input id="ctl06_ctl01_fckContent_dialogOpener_Window_ClientState" name="ctl06_ctl01_fckContent_dialogOpener_Window_ClientState" type="hidden" />
						</div><input id="ctl06_ctl01_fckContent_dialogOpener_ClientState" name="ctl06_ctl01_fckContent_dialogOpener_ClientState" type="hidden" />
					</div><table id="ctl06_ctl01_fckContentWrapper" cellpadding="0" cellspacing="0" style="table-layout:auto;width:100%;height:210px;">
						<tbody>
							<tr>
								<td class="reWrapper_corner reCorner_top_left">&nbsp;</td><td class="reWrapper_center reCenter_top" colspan="3">&nbsp;</td><td class="reWrapper_corner reCorner_top_right">&nbsp;</td>
							</tr><tr>
								<td class="reLeftVerticalSide" rowspan="4">&nbsp;</td><td rowspan="4" id="ctl06_ctl01_fckContentLeft" class="reTlbVertical"></td><td id="ctl06_ctl01_fckContentTop" class="reToolCell" style="width:100%;"><div class="Default reToolbarWrapper">
									<ul class="reToolbar Default">
										<li class="reGrip grip_first">&nbsp;</li><li><a title="Bold" class="reTool" href="#"><span class="Bold">&nbsp;</span></a></li><li><a title="Italic" class="reTool" href="#"><span class="Italic">&nbsp;</span></a></li><li><a title="Align Left" class="reTool" href="#"><span class="JustifyLeft">&nbsp;</span></a></li><li><a title="Align Right" class="reTool" href="#"><span class="JustifyRight">&nbsp;</span></a></li><li><a title="Align Center" class="reTool" href="#"><span class="JustifyCenter">&nbsp;</span></a></li><li><a title="Justify" class="reTool" href="#"><span class="JustifyFull">&nbsp;</span></a></li><li class="reGrip grip_last">&nbsp;</li>
									</ul>
								</div></td><td rowspan="4" id="ctl06_ctl01_fckContentRight" class="reTlbVertical"></td><td rowspan="4" class="reRightVerticalSide">&nbsp;</td>
							</tr><tr>
								<td valign="top" id="ctl06_ctl01_fckContentCenter" class="reContentCell" style="height:100%;"><label for="ctl06_ctl01_fckContentContentHiddenTextarea" style="display:none;">RadEditor hidden textarea</label><textarea id="ctl06_ctl01_fckContentContentHiddenTextarea" name="ctl06$ctl01$fckContent" rows="4" cols="20" style="display:none;"></textarea></td>
							</tr><tr>
								<td class="reToolZone"><table cellpadding="0" cellspacing="0" id="ctl06_ctl01_fckContent_BottomTable" style="width:100%;">
									<tbody>
										<tr>
											<td class="reEditorModesCell"><div class="reEditorModes" id="ctl06_ctl01_fckContent_ModesWrapper">
												<ul>
													<li><a href="javascript:void(0);" title="Design" class="reMode_design reMode_selected"><span>Design</span></a></li><li><a href="javascript:void(0);" title="HTML" class="reMode_html"><span>HTML</span></a></li><li><a href="javascript:void(0);" title="Preview" class="reMode_preview"><span>Preview</span></a></li>
												</ul>
											</div></td><td class="reBottomZone" id="ctl06_ctl01_fckContentBottom">&nbsp;</td><td class="reResizeCell" valign="bottom" align="right" style="width:15px;"><div id="ctl06_ctl01_fckContentBottomResizer">
												&nbsp;
											</div></td>
										</tr>
									</tbody>
								</table><noscript>
									<p>RadEditor - please enable JavaScript to use the rich text editor.</p>
								</noscript></td>
							</tr><tr>
								<td id="ctl06_ctl01_fckContentModule" class="reToolZone"></td>
							</tr><tr>
								<td class="reWrapper_corner reCorner_bottom_left">&nbsp;</td><td class="reWrapper_center reCenter_bottom" colspan="3">&nbsp;</td><td class="reWrapper_corner reCorner_bottom_right">&nbsp;</td>
							</tr>
						</tbody>
					</table><input id="ctl06_ctl01_fckContent_ClientState" name="ctl06_ctl01_fckContent_ClientState" type="hidden" />
				</div>
                        <span style="color: Red; font-size: 12px;">&nbsp;* </span>
                        <span id="ctl06_ctl01_RequiredFieldValidator2" title="Required" style="color:Red;display:none;"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center" height="25px">
                        <input type="submit" name="ctl06$ctl01$btnSend" value="Send" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl06$ctl01$btnSend&quot;, &quot;&quot;, true, &quot;Feedback&quot;, &quot;&quot;, false, false))" id="ctl06_ctl01_btnSend" style="height:25px;width:50px;" />
                        <input type="submit" name="ctl06$ctl01$btnCancel" value="Cancel" id="ctl06_ctl01_btnCancel" style="height:25px;width:50px;" />
                    </td>
                </tr>


            </table>
        </div>
    </div>
</div>
<div id="ctl06_ctl01_rwUserLogin" style="display:none;">
					<div id="ctl06_ctl01_rwUserLogin_C">

					</div><input id="ctl06_ctl01_rwUserLogin_ClientState" name="ctl06_ctl01_rwUserLogin_ClientState" type="hidden" />
				</div>
<script language="javascript" type="text/javascript">
    var dialogMethod;
    function CallWebMethodSuccess(results, context, methodName) {
        switch (methodName) {
            case "AllowWatchArticle":
                {
                    CheckUserWatchCallback(results, context, methodName);
                }
                break;
        }
    }

    function CallWebMethodFailed(results, context, methodName) {
        alert(results._message);
    }
    // check user login
    function getQuerystringNameValue(name) {
        // For example... passing a name parameter of "name1" will return a value of "100", etc.
        // page.htm?name1=100 or page.htm/name1/100
        var articleId;
        var winURL = window.location.href;
        var index = winURL.indexOf(name);
        if (index > -1) {
            winURL = winURL.substr(index, winURL.length);
            var arr = winURL.indexOf("index.html") > -1 ? winURL.split("index.html") : winURL.split("=");;
            articleId = arr[1];
        }
        return articleId;
    }
    function CheckUserWatchArticle() {
        PSCPortal.Services.CMS.AllowWatchArticle(getQuerystringNameValue("ArticleId"), CallWebMethodSuccess);
    }
    var dialogMethod;
    function CheckUserWatchCallback(results, context, methodName) {
        if (!results) {
            dialogMethod = "CheckUserWatchArticle";
            var oWnd = $find("ctl06_ctl01_rwUserLogin");
            oWnd.setSize(380, 180);
            oWnd.setUrl("/Modules/CMS/UserLogin.aspx");
            oWnd.set_title("Login");
            oWnd.show();
        }
    }
    function RadCheckUserWatchClose(sender, args) {
        switch (dialogMethod) {
            case "CheckUserWatchArticle":
                {
                    PSCPortal.Services.CMS.CheckUserWatchArticle(CallCheckUserWatchWebMethodSuccess);
                }
                break;
        }
    }
    function CallCheckUserWatchWebMethodSuccess(results, context, methodName) {
        if (!results)
            window.history.back();
    }
    //end check user login

    function pageLoad() {
        CheckUserWatchArticle();
    }
</script>
<style type="text/css">
    .TelerikModalOverlay {
        filter: alpha(opacity=95) !important; /*for IE 5.5+*/
        opacity: .95 !important; /*for FF 2x, Opera 9x*/
        -moz-opacity: .95 !important; /*for FF 1x*/
        background-color: #666666 !important;
    }
</style>

			</div>
		</div></td><td><div id="pnRight">
			<div id="pnRightDisplay" style="padding:0px 0px 0px 6px;width:300px;float:left">
				<div id='ctl06_portlet_b633be64-8363-4e53-9952-6acf34d3e9e9' style="float:left;"><div>
					
<style type="text/css">

</style>
<div class="thongbao_phong">
    <div class="topictb_phong_blue">
        <h3>Latest news</h3>
        <a class="wobble-horizontal" href="indexc059.html?TopicId=31ca0f13-71be-4bd9-ad28-d3589a3cf6d2">
            <img src="/resources/Resources/ImagesPortal/PhongBan/arrow_all_phong.png"></a>
    </div>
    <div class="listtb_phong">
        <ul>
            

                    <li><a href="index52be.html?ArticleId=3af2fa01-2645-4516-a65a-67bfec768e13">
                        <p>Create Date 09/03/2017</p>
                        SPECIAL SESSION 02 FOR ICSSE2017: FUZZY SYSTEMS AND ITS APPLICATIONS</a></a> </li>
                

                    <li><a href="indexe41c.html?ArticleId=bc474489-26ce-4997-a1c0-b37dce27b202">
                        <p>Create Date 07/03/2017</p>
                        ABSTRACT DEADLINE EXTENSION: MARCH 19, 2017</a></a> </li>
                

                    <li><a href="indexc489.html?ArticleId=f796f938-0681-4d25-b47e-6bcd24536152">
                        <p>Create Date 20/02/2017</p>
                        SPECIAL SESSION 01 FOR ICSSE2017: INTELLIGENT HEALTHCARE SYSTEMS</a></a> </li>
                
        </ul>
    </div>
    <!--end listtb_phong-->
</div>

				</div></div><div id='ctl06_portlet_9d945843-6c22-4daf-9b88-835da3891673' style="float:left"><div>
					<table>
    <tbody>
        <tr>
            <td style="text-align: left; width: 350px; height: 40px; vertical-align: middle; background-color: #ff0000;">&nbsp;<span style="font-size: 20px; color: #ffff00;"><strong>IMPORTANT DEADLINES</strong></span></td>
        </tr>
    </tbody>
</table>
<p style="text-align: justify;"><span style="font-size: 12px; color: #002060;"><strong><br />
</strong></span></p>
<div style="text-align: center;"><strong><strong style="text-align: left;"><span style="font-size: 16px;"><span style="text-decoration: line-through;">March 7, 2017</span><br />
<strong><span style="color: #c00000;">Extended untill March 19, 2017</span></strong><br />
</span></strong></strong></div>
<span style="font-size: 16px; color: #002060;"><strong>
</strong>
</span>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><span style="text-align: left; font-size: 16px;">2-Pages &nbsp;Extended Abstract&nbsp;</span><span style="font-size: 16px;">Submission</span></span></div>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><br />
</span></div>
<span style="font-size: 16px; color: #002060;">
<div style="text-align: center;"><strong style="text-align: left;">March 30, 2017</strong></div>
<div style="text-align: center;"><span style="text-align: left; font-size: 16px;">Notification of Acceptance</span></div>
</span>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><br />
</span></div>
<span style="font-size: 16px; color: #002060;">
<div style="text-align: center;"><strong style="text-align: left;">May 10, 2017</strong></div>
<div style="text-align: center;"><span style="text-align: left; font-size: 16px;">2-6 Pages Final Papers Submission</span></div>
</span><span style="font-size: 16px;"><span style="font-size: 16px; color: #002060;">
</span>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><br />
</span></div>
<span style="font-size: 14px;"><span style="font-size: 16px; color: #002060;">
</span>
<div style="text-align: center;"><span style="font-size: 16px; color: #002060;"><strong style="font-size: medium; text-align: left;">May 30, 2017</strong><span style="text-align: left; font-size: 16px;">:&nbsp;</span></span></div>
<span style="font-size: 16px; color: #002060;"><span style="font-size: 16px;">
</span>
<div style="text-align: center;"><span style="text-align: left; font-size: 16px;">Online Registration</span></div>
</span>
</span>
<br />
</span>

				</div></div><div id='ctl06_portlet_553574d9-9245-4da8-a214-baf51898689a' style="float:left;"><div>
					<table>
    <tbody>
        <tr>
            <td style="width: 350px; height: 40px; background-color: #92d050;"><strong><span><span style="font-size: 20px; color: #c00000;">SPECIAL SESSION</span><br />
            </span></strong></td>
        </tr>
    </tbody>
</table>
<span style="font-size: 10.5pt; letter-spacing: 0.85pt; font-family: &quot;times new roman&quot;, serif;"><strong style="font-weight: bold; color: #002060; font-family: &quot;times new roman&quot;, serif; font-size: 14px; letter-spacing: 1.13333px;"><strong><br />
<a href="https://easychair.org/conferences/?conf=icsse2017specialsess" target="_blank">SPECIAL SESSION SUBMISSION LINK</a>&nbsp;</strong></strong><br />
<span style="font-size: 14px;"><br />
<div style="text-align: center;"><strong style="letter-spacing: 0.85pt; background-color: #ffff00;"><span style="color: #002060;"><strong style="letter-spacing: 1.13333px;"><strong>SPECIAL SESSION&nbsp;</strong></strong>01</span></strong></div>
<strong>
<div style="text-align: center;"><strong style="letter-spacing: 0.85pt;"><span style="background-color: #ffff00; color: #002060;">INTELLIGENT HEALTHCARE SYSTEMS</span></strong></div>
</strong></span>
<div style="font-weight: bold; color: #002060; text-align: center;"><span style="font-size: 10.5pt; letter-spacing: 0.85pt;"><a href="Resources/Docs/SubDomain/icsse2017/SS_cfp_Huang.pdf">CALL FOR PAPERS</a></span></div>
<br />
<div style="text-align: center;"><strong style="font-size: 10.5pt; letter-spacing: 0.85pt; margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 20px;"><strong style="margin: 0px; padding: 0px;"><span style="margin: 0px; padding: 0px; font-size: 14px; background-color: #ffff00; color: #002060;"><strong style="font-family: &quot;times new roman&quot;, serif; font-size: 14px; letter-spacing: 0.85pt; text-align: -webkit-center; background-color: #ffff00;"><span style="color: #002060;"><strong style="letter-spacing: 1.13333px;"><strong>SPECIAL SESSION&nbsp;</strong></strong></span></strong>02<br />
FUZZY SYSTEMS &amp; ITS APPLICATIONS</span></strong></span></strong></div>
<strong style="margin: 0px; padding: 0px; font-size: 14px;">
<div style="text-align: center;"><strong style="letter-spacing: 0.85pt; margin: 0px; padding: 0px;"><a href="Resources/Docs/SubDomain/icsse2017/SS02%20-%20call4pp.pdf" style="margin: 0px; padding: 0px; text-decoration: none;">CALL FOR PAPER</a></strong></div>
</strong>
<br />
</span>

				</div></div><div id='ctl06_portlet_78439b67-a318-4ced-ac29-33d02da2a0fb' style="float:left;"><div>
					<table>
 <tbody>
        <tr>
            <td style= "text-align: left; width: 350px; vertical-align: middle; height: 40px; background-color: #002060;">&nbsp;<span style="font-size: 20px; color: #ffff00;"><strong>KEY LINKS</strong></span></td>
        </tr>
    </tbody>
</table>
<br />
<span style= "color: #002060;"><span style="font-size: 14px;"><a href="https://easychair.org/conferences/?conf=icsse2017" target="_blank"><strong>EASYCHAIR SUBMISSION SITE</strong></a></span><br />
<span style= "font-size: 14px;"><a href="/resources/Resources/Docs/SubDomain/icsse2017/ieeeconf_letter.doc"><br />
<strong>
PAPER FORMAT TEMPLATE DOWNLOAD</strong></a>&nbsp;<br />
</span></span><span style="font-size: 14px;"><br />
<strong><strong style="font-size: 14px;"></strong><strong style="font-size: 14px;"></strong><a href="/resources/Resources/Docs/SubDomain/icsse2017/Instruction%20easychair_ICSSE2017.docx"><strong style="font-size: 14px;">EASYCHAIR&nbsp;</strong>SUBMISSION INSTRUCTION</a></strong></span>

				</div></div>
			</div>
		</div></td>
	</tr>
	</jsp:body>
	</t:template>
</html>
