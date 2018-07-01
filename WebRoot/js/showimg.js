function imgPreview(url, path){
	var html = "<img src='"+path + url+"' width='100%' onerror='this.src=\""+path+"/images/errorimg.jpg\"'>";
	
	
	dialog =art.dialog({
	    content: html,
	    lock: true,
	    resize: true,
	    left: '25%',
	    top: '20%',
    	outsideCancleable: true,
    	padding: '0px 0px'
	});
}