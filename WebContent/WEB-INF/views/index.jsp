<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>

<script type="text/javascript">
/* curl \
  'https://youtube.googleapis.com/youtube/v3/search?part=id&channelId=UCBpTprffc9A7KZyONCHQTIw&maxResults=5&order=date&type=video&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed
 */
	var channelId = 'UCLkAepWjdylmXSltofFvsYQ';
	var key = 'AIzaSyD-GsKkk0mSoiJNIQvLu2Is2vFHBwDjCaw';
	
	$.ajax({
		type : "GET",
		dataType : "json",
		url : 'https://youtube.googleapis.com/youtube/v3/search?part=id&channelId='+channelId+'&maxResults=5&order=date&type=video&key='+key,
		success : function(data){
			//data.items.forEach(function(element,index){$('body').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+' frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')});
			
			for(var i=0; i < data.items.length; i++){
			 var str = '<a href="https://www.youtube.com/watch?v='+data.items[i].id.videoId+'">동영상</a>';
			$('body').append(str);
			}  
			  
			console.log(data.items[0].id.videoId);
			console.log(data.items.length);
		},
		complete : function(data){},
		error:function(xhr,status,error){}
	});

</script>
</html>