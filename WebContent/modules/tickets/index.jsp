<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="content">
<div class="buttons">
<a href="tickets/create" title="Create Ticket" class="new-16">Create</a>
<a  title="Refresh" class="refresh-16">Refresh</a>
 <a title="Help" class="help-16">Help</a> 
</div>
<h1 class="icon-32">Opened Tickets</h1>
<form id="search" action="tickets/opened/search" method="post">
	<span>Search :</span>
	<select name="search.filter">
	   <option value="id">ID</option>
	   <option value="subject">Subject</option>
       <option value="product">Product</option>
       <option value="priority">Priority</option>
	</select>
	<input name="search.value" type="text" value="${search.value}" placeholder="Search..."/>
</form>
<div id="list">
<table>
 <thead>
    <tr>
       <th title="ID">ID</th>
       <th title="Ticket Subject">Ticket Subject</th>
       <th title="Date of Creation">Date of Creation</th>
       <th title="Product">Product</th>
       <th title="Department">Department</th>
       <th title="Priority">Priority</th>
       <th title="Status">Status</th>
    </tr>
 </thead>

<tbody>
  
  <s:iterator value="tickets">
	<tr>
	<td class="icon-16">${id}</td>
	<td title="${subject}"><a href="tickets/opened/details?id=${id}">${subject}</a></td>
	<td><s:date name="dateCreation" format="dd/MM/yyyy hh:mm:ss" /></td>
	<td>${product}</td>
	<td>${department}</td>
	<td>${priority}</td>
	<td>${status}</td>
	</tr>
</s:iterator>
   
 </tbody>
  
</table>

</div>
</div>
<script>
document.addEventListener("DOMContentLoaded", () => {
	const filter = "${search.filter}";
	if(filter) $("#search select").val(filter); 
});
</script>