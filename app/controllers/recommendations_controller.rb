class RecommendationsController < ApplicationController
  def home
  end

  def index
  	@recommendations = Recommendation.all
  end

  def new
  	@recommendation = Recommendation.new
  	if !current_user
  		flash[:alert] = "Accès interdit. Vous devez être connecté pour créer une recommandation."
  		return redirect_to request.referrer || root_path
  	end
  end

  def create
  	#@recommendation = Recommendation.new title: params[:title], content: params[:content], user_id: current_user.id
  	@recommendation = Recommendation.new recommendation_params
    @recommendation.user_id = current_user.id
    @recommendation.status = "draft"
    yield(@recommendation) if block_given?
  	if @recommendation.save
  		flash[:notice] = "Votre recommandation a bien été enregistrée. Vous pouvez à présent la modifier ou la publier."
  		redirect_to "/recommendations/#{@recommendation.id}"
  	else
  		flash[:alert] = "L'enregistrement de la recommandation a échoué."
  		render 'new'
  	end 
  end

  def show
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.status = "draft" && current_user != @recommendation.user
      flash[:error] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
  end

  def publish
    @recommendation = Recommendation.find(params[:id])
    if current_user != @recommendation.user
      flash[:error] = "Action interdite"
      return redirect_to request.referrer || root_path
    else
      if @recommendation.update status: "published"
        flash[:info] = "Votre recommandation est publiée"
        redirect_to "/recommendation/#{params[:id]}"
      else
        flash[:error] = "La recommandation n'a pas été publiée"
        render 'show'
      end
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:title, :content)
  end


end
