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
  	@recommendation = Recommendation.new title: params[:title], content: params[:content], user_id: current_user.id
  	yield @recommendation if block_given?
  	if @recommendation.save
  		flash[:notice] = "Votre recommandation a bien été créée."
  		redirect_to "/"
  	else
  		flash[:alert] = "L'enregistrement de la recommandation a échoué."
  		render 'new'
  	end 
  end
end
