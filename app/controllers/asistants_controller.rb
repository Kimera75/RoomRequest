class AsistantsController < ApplicationController
  expose(:asistant)
  expose(:asistants)
  expose(:asistant_form){ NewAsistantForm.new(asistant_params, asistant: asistant) }

  def create    
    respond_to do |format|
      if asistant_form.save
        format.html { redirect_to asistant_form.asistant, notice: 'Asistant was successfully created.' }
        format.json { render :show, status: :created, location: asistant }
      else
        format.html { render :new }
        format.json { render json: asistant_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asistants/1
  # PATCH/PUT /asistants/1.json
  def update
    respond_to do |format|
      if asistant_form.save 
        format.html { redirect_to asistant.path(asistant_form.asistant), notice: 'Asistant was successfully updated.' }
        format.json { render :show, status: :ok, location: asistant }
      else
        format.html { render :edit }
        format.json { render json: asistant_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asistants/1
  # DELETE /asistants/1.json
  def destroy
    asistant.destroy
    respond_to do |format|
      format.html { redirect_to asistants_url, notice: 'Asistant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asistant
      asistant = Asistant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asistant_params
      return {} unless params[:asistant].present? 
      params.require(:asistant).permit(:code, :name, :carer, :codeEvent)
    end
end
