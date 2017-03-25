class NotesController < ApplicationController
  load_and_authorize_resource only: [:edit, :show, :update]

  def new
   render partial: 'form', locals: {note: Note.new}
 end

 def create
   note = Note.new(note_params)
   note.user = current_user
   note.save!
   redirect_to '/'
 end

 def update
  @note.update(note_params)
  redirect_to '/' 
end

def edit
end

def destroy
end

def index
end

def show
end
private
def note_params
  params.require(:note).permit(:content, :visible_to)
end
end
