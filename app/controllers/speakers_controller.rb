class SpeakersController < ApplicationController
  def index
    @presenters, @no_avatar = Presenter.order('name ASC').partition{|presenter| presenter.avatar.present? }
  end

  def show
    @presenter = Presenter.find(params[:id])
    return redirect_to(speakers_path) unless @presenter.active?
    @episodes = @presenter.episodes.order('published_at DESC')
  end
end

