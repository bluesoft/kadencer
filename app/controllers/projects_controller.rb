class ProjectsController < InheritedResources::Base
  
  def create
    @project = Project.new(params[:project])

     respond_to do |format|
       
       if @project.organization.owner != current_user
         flash[:alert] = 'Only the organization owner can create a project'
         format.html { render :action => "new" }
       elsif @project.save
         @organization.users << current_user
         @organization.owner = current_user
         format.html { redirect_to root_url }
       else
         format.html { render :action => "new" }
       end
     end    
  end
    
  
end
