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
<meta property="og:title"  content="${initParam['app_title']}" />
<meta property="og:description"  content="${initParam['app_description']}" />
<meta property="og:image" content="${baseUrl}/images/image.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/metamorphosis.css" rel="stylesheet" type="text/css" media="all" />
<link href="templates/amadeus/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="templates/amadeus/css/easy-responsive-tabs.css" />
<link href="${css}/module.css" rel="stylesheet" />
 <link href="//fonts.googleapis.com/css?family=Lato" rel="stylesheet"/>
 <link rel="shortcut icon" href="images/logo.png"  sizes="32x32"/>  
</head>
<body class="bg agileinfo">
 <!-- scroll to top  -->   
   <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
   <div class="app_title"><img src="${logo}"/><a href="${baseUrl}">${initParam['app_name']}</a></div>
   <tiles:insertAttribute name="content"/>
   <script src="js/jquery-3.1.1.min.js"></script>
   <script src="templates/amadeus/js/easyResponsiveTabs.js"></script>
   <script src="js/metamorphosis.js"></script>
   <div class="agileits_w3layouts_copyright text-center">
			<p>&copy; 2017 Designed by <a href="//w3layouts.com/" target="_blank">W3layouts</a> and <a href="https://www.thinktech.sn/" target="_blank">ThinkTech</a></p>
	</div>
  <script src="https://use.fontawesome.com/cb87d958ba.js" async defer></script>
  <script src="${js}/module.js" async defer></script>
</body>
</html>

