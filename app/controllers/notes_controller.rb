class NotesController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @note = Note.new(note_params)
    @note.save
    render json: @note
  end

  def show
    set_note
    render json: @note
  end

  def update
    set_note
    @note.update(note_params)
    render json: @note
  end

  def destroy
    set_note
    @note.destroy
    head :no_content
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def set_note
    @note = Note.find(params[:id])
  end

end
