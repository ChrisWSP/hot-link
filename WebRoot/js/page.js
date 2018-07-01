 function showPage (numPage,curPage,showPage,pageaction,pagetj,totalPages) {
                var page = document.getElementById("page2");
                var first;//第一页
                var last;//最后一页
                if((curPage - showPage) > 0){
                    first = curPage - showPage;
                }
                else{
                    first = 1;
                }
                 
                if(numPage > (curPage + showPage)){
                    last = curPage + showPage;
                }
                else{
                    last = numPage;
                }
                
                if(curPage!=1){
                	page.innerHTML+="<li><a href=\""+pageaction+"?pageNo=1"+pagetj+"\"> &lt&lt </a></li>";
                	page.innerHTML+="<li><a href=\""+pageaction+"?pageNo="+(curPage-1)+""+pagetj+"\"> &lt </a></li>";
                } else{
                	page.innerHTML+="<li class='disabled'><a href='javascript:void(0);'> &lt&lt </a></li>";
                	page.innerHTML+="<li class='disabled'><a href='javascript:void(0);'> &lt </a></li>";
                }
                
                for( ; first <= last; first++){
                    if(first == curPage){
                    	page.innerHTML += "<li class='active'><a href='javascript:void(0);'>"+first+"</a></li>";
                    }
                    else{
                        page.innerHTML += "<li><a href=\""+pageaction+"?pageNo="+first+""+pagetj+"\">" + first +  "</a></li>";
                    }
                }
               
				if(numPage==curPage){
					page.innerHTML+="<li class='disabled'><a href='javascript:void(0);'> &gt&gt </a></li>";
                	page.innerHTML+="<li class='disabled'><a href='javascript:void(0);'> &gt </a></li>";
                }else{
                	if(numPage>1){
                		page.innerHTML += "<li><a href=\""+pageaction+"?pageNo="+(curPage+1)+""+pagetj+"\"> &gt </a></li>";
                		page.innerHTML += "<li><a href=\""+pageaction+"?pageNo="+numPage+""+pagetj+"\"> &gt&gt </a></li>";
                	}
                }
				page.innerHTML += "<li ><a href='javascript:void(0);'>&nbsp;&nbsp;&nbsp;共"+totalPages+"条&nbsp"+numPage+"页</a></li>";
            }
             