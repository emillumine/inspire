class RecommendationsController < ApplicationController
  
  before_action :set_recommendation, only: [:show, :update]

  def home
  end

  def index
  	@recommendations = Recommendation.where(published: true).order("published_at DESC")
  end

  def new
  	@recommendation = Recommendation.new
  	unless current_user
  		flash[:alert] = "Accès interdit. Vous devez être connecté pour créer une recommandation."
  		return redirect_to request.referrer || root_path
  	end
  end

  def create
  	@recommendation = Recommendation.new recommendation_params
    @recommendation.user_id = current_user.id
    @recommendation.published = false
    yield(@recommendation) if block_given?
  	if @recommendation.save
  		flash[:notice] = "Votre recommandation a bien été enregistrée comme brouillon."
  		if params[:published]
        if @recommendation.update published: true, published_at: Time.zone.now
          flash[:notice] = "Votre recommandation a été publiée."
        else
          flash[:alert] = "Votre recommandation n'a pas été publiée."
        end
      end
      redirect_to "/recommendations/#{@recommendation.id}"
  	else
  		flash[:alert] = "L'enregistrement de la recommandation a échoué."
  		render 'new'
  	end 
  end

  def show
    unless @recommendation.published? || @recommendation.user == current_user
      flash[:alert] = "Accès interdit"
      return redirect_to request.referrer || root_path
    end
  end

  def update
    if @recommendation.update recommendation_params
      flash[:notice] = "Votre recommandation a bien été enregistrée comme brouillon."
      if params[:published]
        if @recommendation.update published: true, published_at: Time.zone.now
          flash[:notice] = "Votre recommandation a été publiée."
        else
          flash[:alert] = "Votre recommandation n'a pas été publiée."
        end
      end
      redirect_to "/recommendations/#{@recommendation.id}"
    else
      flash[:alert] = "L'enregistrement de la recommandation a échoué"
      render 'show'
    end
  end

  def drafts_index
    @recommendations = Recommendation.where(user_id: current_user.id, published: false)
    unless current_user
      flash[:alert] = "Accès interdit. Vous devez être connecté pour voir vos brouillons."
      return redirect_to request.referrer || root_path
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:title, :content)
  end

  def set_recommendation
    @recommendation = Recommendation.find(params[:id])
  end

end
