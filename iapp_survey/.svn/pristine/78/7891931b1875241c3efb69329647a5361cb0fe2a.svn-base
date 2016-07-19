<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>账号开通邮件</title>
    <style>
        body {
            background: #fff;
            margin: 0;
            padding: 10px;
            font-family: Verdana;
        }

        .container {
            padding: 10px 0;
        }

        .title span {
            font-size: 10.0pt;
            font-family: 宋体;
        }

        span.a {
            font-size: 10.0pt;
            font-family: 宋体
        }

        span.b {
            font-size: 10.0pt;
        }

        span.c {
            font-size: 10.0pt;
            color: windowtext;
        }

        span.d {
            font-size: 10.0pt;
            font-family: 宋体;
            color: black
        }

        span.e {
            font-size: 10.0pt;
            color: black;
        }

        span.f {
            font-size: 10.0pt;
            color: blue;
        }

        span.g {
            font-size: 10.0pt;
            color: #1F497D;
        }

        span.h {
            mso-ignore: vglayout;
        }

        span.i {
            font-size: 9.0pt;
            color: #1F497D;
        }

        span.j {
            color: #1F497D;
        }

        p.a {
            text-autospace: none;
        }

        p.b {
            mso-margin-top-alt: auto;
            mso-margin-bottom-alt: auto
        }

        li.a {
            mso-margin-top-alt: auto;
            mso-margin-bottom-alt: auto;
            mso-list: l1 level1 lfo3;
        }

        li.b {
            mso-margin-top-alt: auto;
            mso-margin-bottom-alt: auto;
            mso-list: l0 level1 lfo6;
        }
        .font_arial {
            font-family: Arial;
        }
    </style>
</head>

<body>
<div class="container">
    <p class="title"><span>${user.name}，您好!</span>
    </p>

    <p><span></span>
    </p>

    <p><span class="a" lang="ZH-CN">很高兴的通知您，您的美世在线课堂学习账号已被成功开通。</span>
    </p>

    <p><span class="b"></span>
    </p>

    <p><span class="a" lang="ZH-CN">美世在线课堂是<b>美世中国学习与发展业务基于美世人力资源能力模型</b>开发的<b>服务于全球客户</b>的在线学习平台。课程体系聚焦<b>业务伙伴、绩效与薪酬、人才招募、人才管理、组织发展与变革、员工关系</b></span><b><span class="b font_arial" style="font-family:Arial">6</span></b><b><span class="a" lang="ZH-CN">大模块</span></b><span class="a" lang="ZH-CN">，涵盖共</span><b><span class="b font_arial" style="font-family:Arial">20</span></b><b><span class="a" lang="ZH-CN">门课程</span></b><span class="a" lang="ZH-CN">。<b>美世在线课堂旨在帮助学员系统掌握人力资源各领域专业知识、工具和方法，全面提升其人力资源专业素养，改善核心技能</b>。</span><span class="b"></span>
    </p>



    <p><b><span class="b"></span></b>
    </p>

    <p><b><span class="a" lang="ZH-CN">您的学习账号信息如下：</span></b><span class="b"></span>
    </p>
    <ul type="disc">
        <li class="a">
            <b><span class="a" lang="ZH-CN">学习站点：</span></b><span><a href="http://mercer.aijiayou.com"><span class="c font_arial" style="font-family:Arial">http://mercer.aijiayou.com</span>
        </a>
					</span><b><span

                class="b"></span></b>
        </li>
        <li class="a">
            <b><span class="a" lang="ZH-CN">用户名：</span></b><span class="b font_arial" style="font-family:Arial"><span>${user.username}</span></span><b><span

                class="b"></span></b>
        </li>
        <li class="a">
            <b><span class="a" lang="ZH-CN">密码：</span></b><span class="b font_arial" style="font-family:Arial">${password}<b></b></span>
        </li>
	<#if user.effictivestart?? || user.effictiveend??>
        <li class="a">
            <b><span class="a" lang="ZH-CN">账号有效期：</span></b>
			<#if user.effictivestart??>
            <span class="b font_arial" style="font-family:Arial">${user.effictivestart?number_to_date?string("yyyy年MM月dd日")}
			</#if>
			<#if !user.effictivestart??>
                现在
			</#if>
            至
			<#if user.effictiveend??>
			${user.effictiveend?number_to_date?string("yyyy年MM月dd日")} </span></b>
			</#if>
			<#if !user.effictiveend??>
                不限
			</#if>
        </li>
	</#if>
    </ul>
    <p><b><span class="a" lang="ZH-CN">请您在开始学习之前确认您的电脑符合以下要求：</span></b><span class="b"></span>
    </p>
    <ul type="disc">
        <li class="b">
            <span class="a" lang="ZH-CN">浏览器为</span><span class="b font_arial" style="font-family:Arial">Firefox</span><span class="a" lang="ZH-CN">、</span><span class="b font_arial" style="font-family:Arial">Chrome</span><span class="a" lang="ZH-CN">、</span><span class="b font_arial" style="font-family:Arial">IE9</span><span class="a" lang="ZH-CN">及以上版本</span><span class="b"></span>
        </li>
        <li class="b">
            <span class="a" lang="ZH-CN">浏览器需要</span><span class="b font_arial" style="font-family:Arial">Adobe Flash Player</span><span class="a" lang="ZH-CN">插件（会自动提示安装）</span><span class="b"></span>
        </li>
    </ul>
    <p class="b"><span class="a" lang="ZH-CN">如您在系统使用过程中遇到任何问题，或对于美世在线课堂有任何意见与建议，请联系<span class="font_arial" style="font-family:Arial">Stephanie Deng</span>邓堃</span> <span class="a">(</span><span class="f font_arial" style="font-family:Arial"><a href="mailto:stephanie.deng@mercer.com">stephanie.deng@mercer.com</a></span>;<span class="e font_arial" style="font-family:Arial"> 021-61035486</span><span class="a">)。</span>
    </p>

    <p class="b"><span class="a" lang="ZH-CN">祝您学习愉快！</span><span class="b"></span>
    </p>
    <p class="b"><span class="a" lang="ZH-CN">美世学习与发展咨询业务</span><span class="b"></span>
    </p>
</div>
</body>
</html>