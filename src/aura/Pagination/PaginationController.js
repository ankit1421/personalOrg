({
	firstPage : function (componet,helper,event){
       componet.set("v.currentPageNumber",1)
   },
   prevPage : function(componet,helper,event){
      component.set("v.currentPageNumber", Math.max(component.get("v.currentPageNumber")-1, 1));
   },
   nextPage : function(componet,helper,event){
      component.set("v.currentPageNumber", Math.min(component.get("v.currentPageNumber")+1, component.get("v.maxPageNumber")));
   },
   lastPage : function(componet,helper,event){
      component.set("v.currentPageNumber", component.get("v.maxPageNumber"));
   }
})