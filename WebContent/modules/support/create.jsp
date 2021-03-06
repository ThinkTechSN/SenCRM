<div id="content">
<div class="buttons">
 <a href="${referer}" title="Back" class="back-16">Back</a>
 <a title="Help" class="help-16">Help</a>
</div>
<h1 class="icon-32">New Ticket</h1>
<div>

<form id="form" action="tickets/save">
<fieldset>
<legend>Information</legend>
<label class="required text-right">Department :</label>
<select name="ticket.department">
<option value="Technical Support">Technical Support</option>
<option value="Sales">Sales</option>
<option value="Billing">Billing</option>
<option value="Software">Software</option>
</select>
<label class="required text-right">Product :</label>
<select name="ticket.product">
<option value="SenTube">SenTube</option>
<option value="SenCRM">SenCRM</option>
<option value="SenTickets">SenTickets</option>
</select>
<label class="required text-right" class="required">Subject :</label>
<input type="text" required name="ticket.subject" maxlength="50"/>
<label class="required text-right">Priority :</label>
<select name="ticket.priority">
<option value="low">low</option>
<option value="normal" selected>normal</option>
<option value="urgent">urgent</option>
</select>
<div class="message">
<h4>Enter your Message</h4>
<textarea id="editor" name="ticket.message"> </textarea>
</div>
<input type="submit" title="Create Ticket"  value="Create"/>
</fieldset>
</form>
</div>
</div>
<script src="https://cdn.ckeditor.com/4.6.2/basic/ckeditor.js"></script>
<script>
  CKEDITOR.replace('editor');
  document.addEventListener("DOMContentLoaded", function(){
		$("input:first").focus();
		$("form").on("submit",function(){
			if(CKEDITOR.instances.editor.getData().trim() =='') {
				  alert("Enter your message",function() {
					  CKEDITOR.instances.editor.focus(); 
				  });
				  return false;
			} 
			$("input[type=submit]",this).attr("disabled","disabled");
		    return true;
		});
  });
</script>