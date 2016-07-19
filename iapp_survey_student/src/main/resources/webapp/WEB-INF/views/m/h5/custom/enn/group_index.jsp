<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/include/taglibs_m.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
	<title>分组索引</title>
	<link rel="stylesheet" type="text/css" href="${basepath }/static/m_h5/enn/nianhui2016/css/style.css">
</head>
<body class="bg-f1">
	<div class="title-link" onclick="window.location='group.xhtml'">
		点击进入 各组位置参考图
	</div>

	<section class="wrap">
		<div class="wrap-top">
			<div class="wrap-title">
				<div class="wrap-intro">新奥集团2016年春季干部管理培训分组索引</div>
			</div>
		</div>
		<div class="wrap-tel">
			<div class="wrap-tel-content">
				<span>负责人 : 孙晶晶</span>
				<span>TEL : <a href="tel:15123696091">15123696091</a></span>
			</div>
		</div>
		<div class="wrap-char-box">
			<div class="char-index">姓名首字母索引</div>
			<div class="char-tip">请点击姓氏首字母，跳转到自己所在分组列表</div>
			
			<table class="char-table">
				<tr>
					<td><a href="#AC">A</a></td>
					<td><a href="#">B</a></td>
					<td><a href="#AC">C</a></td>
					<td><a href="#DFG">D</a></td>
					<td><a href="#DFG">E</a></td>
					<td><a href="#">F</a></td>
				</tr>
				<tr>
					<td><a href="#DFG">G</a></td>
					<td><a href="#H">H</a></td>
					<td>I</td>
					<td><a href="#J">J</a></td>
					<td>K</td>
					<td><a href="#L">L</a></td>
				</tr>
				<tr>
					<td><a href="#MNOP">M</a></td>
					<td><a href="#MNOP">N</a></td>
					<td><a href="#MNOP">O</a></td>
					<td><a href="#MNOP">P</a></td>
					<td><a href="#QRS">Q</a></td>
					<td><a href="#QRS">R</a></td>
				</tr>
				<tr>
					<td><a href="#QRS">S</a></td>
					<td><a href="#">T</a></td>
					<td><a href="#">U</a></td>
					<td><a href="#">V</a></td>
					<td><a href="#W">W</a></td>
					<td><a href="#X">X</a></td>
				</tr>
				<tr>
					<td><a href="#Y">Y</a></td>
					<td><a href="#Z">Z</a></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</table>
		</div>
	</section>

	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/AC.jpg" id="AC" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/DFG.jpg" id="DFG" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/H.jpg" id="H" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/J.jpg" id="J" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/L.jpg" id="L" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/MNOP.jpg" id="MNOP" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/QRS.jpg" id="QRS" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/W.jpg" id="W" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/X.jpg" id="X" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/Y.jpg" id="Y" alt="" />
	<img class="char-img" src="${basepath }/static/m_h5/enn/nianhui2016/img/char/Z.jpg" id="Z" alt="" />



	<div class="go-top"></div>


	<script type="text/javascript" src="${basepath }/static/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		$(function (){
			$('.go-top').click(function (){
				goTop(200);
			})

			function goTop(times){
				if(!!!times){
					$(window).scrollTop(0);
					return;
				}
			  
				var sh=$('body').scrollTop();
				var inter=13.333;
				var forCount=Math.ceil(times/inter);
				var stepL=Math.ceil(sh/forCount);
				var timeId=null;
				ani();
				function ani(){
					!!timeId&&clearTimeout(timeId);
					timeId=null;
					if($('body').scrollTop()<=0||forCount<=0){
						$('body').scrollTop(0);
						return;
					}
					forCount--;
					sh-=stepL;
					$('body').scrollTop(sh);
					timeId=setTimeout(function(){ani();},inter);
				}
			}
		})
	</script>
</body>
</html>