class ProjectsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html, :js 
  actions :show, :new, :index, :edit, :destroy, :update
  
  def index    
    projects = Project.of_user(current_user.id)
    @projects_map = {}
    projects.each { |p|
      if (!@projects_map[p.organization_id]) then
          @projects_map[p.organization_id] = []
      end
      @projects_map[p.organization_id] << p            
    }    
  end
  
  def new
    @organization = Organization.of_owner(current_user.id)
    puts @organization.name
    super
  end
  
  def edit
    @organization = Organization.of_owner(current_user.id)
    @project = Project.find(params[:id])
    if @project.organization.owner.id == current_user.id then      
      respond_to do |format|       
         format.html { render :action => "edit" }
       end
     else
       flash[:alert] = 'Only the organization owner can edit the project'
       redirect_to "/projects"
    end    
  end
    
  def create
    @project = Project.new(params[:project])    
    @project.organization = Organization.find(params[:organization_id])
       if @project.organization.owner != current_user
         flash[:alert] = 'Only the organization owner can create a project'         
         redirect_to @project
       elsif @project.save
         respond_to do |format|       
            format.html { render :action => "show" }
          end
       else
         respond_to do |format|       
           format.html { render :action => "new" }
         end
       end     
  end
  
  def destroy
    @project = Project.find(params[:id])
    if @project.organization.owner.id == current_user.id then
      @project.destroy
      respond_to do |format|
        format.html { redirect_to(projects_url) }
      end
    else
      flash[:alert] = 'Only the organization owner can delete the project'
      redirect_to "/projects"
    end    
  end  

end
