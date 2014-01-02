<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Your friend May be in Danger! - Protect Me!</title>
<style type="text/css">
#RedHeader {
	font-family: Georgia, "Times New Roman", Times, serif;
	color: #F00;
	font-size: x-large;
	font-weight: bold;
	text-transform: capitalize;
}

body {
	background-color: #E3E8EC;
}

table {
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}

#Status_Card_Title {
	font-family: "Courier New", Courier, monospace;
	font-size: 18px;
	color: #009;
	text-decoration: underline;
	text-align: center;
	font-weight: bold;
}

#Status_card_element {
	text-align: center;
}

#Content {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: medium;
}
</style>
</head>

<body>
	<table width="800" border="1" align="center">
		<tr>
			<td align="center" valign="middle"><img src="static/images/Banner.jpg" width="800" align="middle" /></td>
		</tr>
		<tr>
			<td align="center" valign="middle"><p id="RedHeader">Your
					friend [Name here] May be in Danger !</p>
				<p>[Name Here]'s Google Glass had detected a abnormal shock and
					the user had failed to respon to the security question.</p>
				<p>To ensure [Name Here] is alright, please do the following:</p>
				<ol>
					<li>Look for him if he/she is near by.</li>
					<li>Call [Name Here] at (xxx) xxx-xxxx, re-dail in ~10 minute
						intervals.</li>
					<li>If he/she didn't respon in 2 hours, contact his/her
						relatives and his/her significant other.</li>
					<li>If he/she didn't respon in a day, contact law enforcement.</li>
				</ol>
				<p>Here are his last known locations and surrounding data.</p></td>
		</tr>
		<tr>
			<td><table width="800" border="1">
					<c:forEach items="${trackDataList}" var="trackData">
						<tr>
							<td>
								<p id="Status_Card_Title">${trackData.creationDate}</p> <span
								id="Status_card_element"><img src="${trackData.imagePath}" height="270" /></small>
									<iframe width="270" height="270" frameborder="0" scrolling="no"
										marginheight="0" marginwidth="0"
										src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;sspn=0.156597,0.292511&amp;ie=UTF8&amp;q=${trackData.latitude},${trackData.longtitude}&amp;ll=${trackData.latitude},${trackData.longtitude}&amp;spn=0.001221,0.002285&amp;t=m&amp;z=14&amp;output=embed"></iframe>
							</span><br /> <br /> </a> <span id="Status_card_element">
									<p>
										<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
											codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0"
											width="300" height="40">
											<param name="movie"
												value="http://www.staticplayer.com/Flash/chameleon.swf" />
											<param name="AllowScriptAccess" value="always" />
											<param name="quality" value="high" />
											<param name="scale" value="noscale" />
											<param name="salign" value="lt" />
											<param name="wmode" value="transparent" />
											<param name="flashvars"
												value="mp3_url=http://www.staticplayer.com/Flash/chameleon.mp3&autoplay=no&bg_type=color&bg_width=790&bg_height=40&bg_alpha=100&bg_color=0xE3E8EC&bg_image=&border_type=none&border_color=0xAAAAAA&border_width=1&border_alpha=100&border_ellipse=1&play_color=0x8BA870&play_width=25&play_height=30&play_x=5&play_y=5&show_bar=yes&playbar_color=0x8BA870&load_color=0x8BA870&load_width=145&load_height=5&load_x=35&load_y=20&show_text=yes&text_size=10&text_color=0x111111&text_x=32&text_y=5&text_idle=Audio (3seconds)" />
											<embed src="http://www.staticplayer.com/Flash/chameleon.swf"
												allowscriptaccess="always" quality="high" scale="noscale"
												salign="lt" wmode="transparent"
												flashvars="mp3_url=http://www.staticplayer.com/Flash/chameleon.mp3&autoplay=no&bg_type=color&bg_width=790&bg_height=40&bg_alpha=100&bg_color=0xE3E8EC&bg_image=&border_type=none&border_color=0xAAAAAA&border_width=1&border_alpha=100&border_ellipse=1&play_color=0x8BA870&play_width=25&play_height=30&play_x=5&play_y=5&show_bar=yes&playbar_color=0x8BA870&load_color=0x8BA870&load_width=145&load_height=5&load_x=35&load_y=20&show_text=yes&text_size=10&text_color=0x111111&text_x=32&text_y=5&text_idle=Audio (3seconds)"
												pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash"
												type="application/x-shockwave-flash" width="791" height="41"></embed>
										</object>
										<br /> 
									</p>
							</span>
							</td>
						</tr>
					</c:forEach>

				</table></td>
		</tr>
	</table>
</body>
</html>
