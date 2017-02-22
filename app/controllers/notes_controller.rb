class NotesController < ApplicationController
	load_and_authorize_resource only: [:edit, :show, :update]
	def new
		@note = Note.new

	end
	def create

		if ! session[:user_id] || session[:user_id] ==""
			redirect_to "/"
		else
		  note=Note.create(note_params)
		  note.user_id=current_user.id
		  
		  note.save

		  redirect_to("/")
		end	
	end
    def show
    	@note=Note.find(params[:id])
    end
    def edit
    	@note=Note.find(params[:id])
        
    end
    def update
    	@note.update(note_params)
    	@note.visible_to= params[:note][:visible_to]
    	@note.save
    	redirect_to("/")
    end
	private
	def note_params
		params.require(:note).permit(:content,:visible_to)
	end
end