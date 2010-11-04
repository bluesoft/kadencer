class ProjectsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html
  actions :show, :new, :create, :index
  
  def index
    
  end
    
  def create
    @project = Project.new(params[:project])     
       if @project.organization.owner != current_user
         flash[:alert] = 'Only the organization owner can create a project'         
         respond_to do |format|       
           format.html { render :action => "new" }         
         end
       elsif @project.save
         respond_to do |format|       
            format.html { render :action => "show" }
          end
       else
         puts @project.errors
         respond_to do |format|       
           format.html { render :action => "new" }
         end
       end     
  end
  

end
