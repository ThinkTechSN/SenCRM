<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<base href="${path}"/>
<title>${title}</title>
<meta property="og:url"  content="${baseUrl}" />
<meta property="og:type" content="website" />
<meta property="og:title"  content="${app_title}" />
<meta property="og:description"  content="${app_description}" />
<meta property="og:image" content="${baseUrl}/images/image.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/metamorphosis.css" rel="stylesheet" type="text/css" media="all" />
<link href="https://fonts.googleapis.com/css?family=Exo" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="templates/amadeus/css/template.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="templates/amadeus/css/easy-responsive-tabs.css" />
<link href="${css}/module.css" rel="stylesheet" />
 <link rel="shortcut icon" href="images/logo.png"  sizes="32x32"/>  
</head>
<body class="bg agileinfo">
 <!-- scroll to top  -->   
   <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
   <header>
   <div class="app_title"><img src="${logo}"/><a href="${baseUrl}">${app_name}</a></div>
   <div class="search">
      <form action="public/search">
      <i class="fa fa-search"></i>
      <input name="query" type="text" data-translation="search"/>
      </form>
   </div>
   <div class="language">
	<select id="select">
	     <option id="english" value="en" data-translation="english"></option>
	    <option id="french" value="fr" data-translation="french"></option>
	</select>
	</div>
   </header>
   <div class="aside">
	    <a  href="https://sencrm.wordpress.com/news/" target="_blank" class="title"><i class="fa fa-newspaper-o"></i><span data-translation="news"></span></a>
	    <a  href="https://sencrm.wordpress.com/" target="_blank" class="title"><i class="fa fa-rss"></i><span data-translation="blog"></span></a>
	    <a href="public/faq"  class="title"><i class="fa fa-question-circle"></i><span data-translation="faq"></span></a>
	    <div class="socials">
	     <a><i class="fa fa-facebook"></i></a>
	     <a><i class="fa fa-twitter"></i></a>
	     <a><i class="fa fa-youtube"></i></a>
	     <a><i class="fa fa-linkedin"></i></a>
	    </div>
    </div>
    <div class="aside right">
        <a href="http://support.thinktech.sn/login" target="_blank" class="title"><i class="fa fa-ticket"></i><span data-translation="support"></span></a>
	    <a  href="https://sencrm.wordpress.com/community/" target="_blank"  class="title"><i class="fa fa-handshake-o"></i><span data-translation="community"></span></a>
	    <a id="contact"  class="title"><i class="fa fa-envelope"></i><span data-translation="contact"></span></a>
    </div>
   <tiles:insertAttribute name="content"/>
   <div id="contact-form">
     <img title="close" class="close" src="templates/amadeus/images/close.png"/>
     <h1><i class="fa fa-envelope"></i><span data-translation="contact"></span></h1>
     <form  action="contact" method="post" class="topBefore">
		  <input id="name" name="mail.author" required type="text" data-translation="name">
		  <input id="email" name="mail.address" required type="email" data-translation="email">
		  <input id="subject" name="mail.subject" required type="text" data-translation="subject">
		  <textarea id="message" name="mail.content" required data-translation="message"></textarea>
  	      <input id="submit" type="submit" data-translation="send-now">
	</form>
   </div>
   <footer>
   <div class="footer-item">
     <h1 data-translation="getting-started"></h1>
     <ul>
       <li><a href="public/understanding"><span data-translation="understanding"></span> ${app_name}</a></li>
       <li><a href="public/overview"><span data-translation="how_it_works"></span></a></li>
       <li><a href="public/usage"><span data-translation="how_to_use_it"></span></a></li>
       <li><a href="public/customers"><span data-translation="customers"></span></a></li>
       <li><a href="public/partners"><span data-translation="partners"></span></a></li>
       <li><a href="registration/terms"><span data-translation="terms"></span></a></li>
       <li><a href="registration/privacy"><span data-translation="privacy"></span></a></li>
     </ul>
   </div>
   <div class="footer-item">
     <h1 data-translation="quick-links"></h1>
     <ul>
       <li><a href="public/pricing"><span data-translation="pricing"></span></a></li>
       <li><a href="documentation"><span data-translation="documentation"></span></a></li>
       <li><a href="https://sencrm.wordpress.com/" target="_blank"><span data-translation="blog"></span></a></li>
       <li><a href="http://support.thinktech.sn/login" target="_blank"><span data-translation="support"></span></a></li>
       <li><a href="https://sencrm.wordpress.com/community/" target="_blank"><span data-translation="community"></span></a></li>
       <li><a href="https://sencrm.wordpress.com/news/" target="_blank"><span data-translation="news"></span></a></li>
       <li><a href="public/faq"><span data-translation="faq"></span></a></li>
     </ul>
   </div>
   <div class="footer-item">
     <h1 data-translation="subscribe-newsletter"></h1>
     <div class="newsletter">
       <input type="text" data-translation="email"/>
       <input type="submit" value="" data-translation="subscribe"/>
     </div>
     <h1 data-translation="tell-your-friends"></h1>
     <div class="share-this">
      <div class="sharethis-inline-share-buttons"></div>
     </div>
   </div>
   <div class="socials">
	     <a><i class="fa fa-facebook"></i></a>
	     <a><i class="fa fa-twitter"></i></a>
	     <a><i class="fa fa-youtube"></i></a>
	     <a><i class="fa fa-linkedin"></i></a>
   </div>
   <div class="agileits_w3layouts_copyright text-center">
			<p>&copy; <span data-translation="designed-by"></span> <a href="//w3layouts.com/" target="_blank">W3layouts</a> <span data-translation="and"></span> <a href="https://www.thinktech.sn/" target="_blank">ThinkTech</a></p>
	</div>
	</footer>
    <script src="js/jquery-3.1.1.min.js"></script>
   <script src="templates/amadeus/js/easyResponsiveTabs.js"></script>
   <script src="js/metamorphosis.js"></script>
   <script>
      app.translate("i18n/app","${request.locale.language}");
      app.translate("modules/${module.folder.name}/i18n/module");
   </script>
   <script src="templates/amadeus/js/template.js" async defer></script>
  <script src="${js}/module.js" async defer></script>
  <script type="text/javascript" src="//platform-api.sharethis.com/js/sharethis.js#property=590f03b42c145800128d5487&product=inline-share-buttons" async defer></script>
   
</body>
</html>

