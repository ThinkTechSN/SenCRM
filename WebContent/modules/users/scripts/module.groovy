import org.metamorphosis.core.ActionSupport
import org.metamorphosis.core.User

class UserAction extends ActionSupport {

	def user = new User()
	
	def login()  {
	    println "agent "+request.getHeader("user-agent")
		if(user.email.equals("lamine.ba@thinktech.sn")) {
		  user.firstName = "Mamadou Lamine"
		  user.lastName = "Ba"
		  user.role = "support"
		  user.structure.name = "ThinkTech"
		  session.setAttribute("user",user)
		  def module = moduleManager.getMain(user)
		  def url = module ? request.contextPath+"/"+module.url: request.contextPath+"/"
		  response.writer.write(groovy.json.JsonOutput.toJson([url: url]))
		}else if(user.email.equals("pbb@thinktech.sn")) {
		  user.firstName = "Pape Babacar"
		  user.lastName = "Ba"
		  user.role = "customer"
		  user.structure.name = "ThinkTech"
		  session.setAttribute("user",user)
		  def module = moduleManager.getMain(user)
		  def url = module ? request.contextPath+"/"+module.url: request.contextPath+"/"
		  response.writer.write(groovy.json.JsonOutput.toJson([url: url]))
		}else if(user.email.equals("mamadou.diaw@thinktech.sn")) {
		  user.firstName = "Mamadou"
		  user.lastName = "Diaw"
		  user.role = "support"
		  user.structure.name = "ThinkTech"
		  session.setAttribute("user",user)
		  def module = moduleManager.getMain(user)
		  def url = module ? request.contextPath+"/"+module.url: request.contextPath+"/"
		  response.writer.write(groovy.json.JsonOutput.toJson([url: url]))
		}
		else {
		  response.setStatus(404)
		  response.writer.write(groovy.json.JsonOutput.toJson([message: "login or password incorrect"]))
		}
		
	}
	
	def logout() {
	    session.invalidate()
		SUCCESS
	}
	
	def selectTemplate() {
	    def id = request.getParameter("id");
		def template = templateManager.getTemplate(id)
		if(template && template.backend) session.setAttribute("template",id)
		response.sendRedirect(referer)
	}
	
	def changePassword() {
	    println "changing password"
	    SUCCESS
	}
	
}

new UserAction()