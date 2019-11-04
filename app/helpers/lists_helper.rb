module ListsHelper
    def remove_list
        if @list.tasks.present?
            if params[:move_to_list].present?
              list = List.find(params[:move_to_list])
              list.tasks << @list.tasks
              @list.destroy
      
              render :json => {message: "All Tasks are moved to list #{list.name} from Board #{list.board.name}"}
            else
              @list.tasks.each do |task|
                task.destroy
              end
              @list.destroy
      
              render :json => {message: "Remove List Success!!"}
            end
          else
            @list.destroy
            
            render :json => {message: "Remove List Success!!"}
          end
    end
    
end