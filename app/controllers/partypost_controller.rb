class PartypostController < ApplicationController
  before_action :current_user
  def index
    if current_user
      unless current_user.create_name
        redirect_to main_firstlogin_path
      end
    end
    @partyposts = Partypost.all
  end

  def partycreate
    p = Partypost.new
    p.article = params[:article]
    p.user = current_user
    p.total = params[:total]
    p.save
    redirect_to "/partypost"
  end

  def partylike
    l = Partylike.new
    l.user = current_user
    l.partypost_id = params[:post_id]
    l.save
    redirect_to "/partypost"
  end

  def partyunlike
    l = Partylike.where(:partypost_id => params[:post_id]).where(:user => current_user).take
    l.delete
    redirect_to "/partypost"
  end

  def partyjoin
    j = Partyjoin.new
    j.user = current_user
    j.partypost_id = params[:post_id]
    j.save
    redirect_to "/partypost"
  end

  def partydisjoin
    j = Partyjoin.where(:partypost_id => params[:post_id]).where(:user => current_user).take
    j.delete
    redirect_to "/partypost"
  end

  puts "Test"
  us = User.all
  us.each do |u|
    puts u.id
    puts u.bname
  end
end
