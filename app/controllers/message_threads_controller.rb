class MessageThreadsController < ApplicationController

  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @message_threads }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message_thread }
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message_thread }
    end
  end

  def edit
  end

  def create
    @message_thread.creator = current_user
    respond_to do |format|
      if @message_thread.save
        format.html { redirect_to @message_thread, notice: 'Message thread was successfully created.' }
        format.json { render json: @message_thread, status: :created, location: @message_thread }
      else
        format.html { render action: "new" }
        format.json { render json: @message_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message_thread.update_attributes(params[:message_thread])
        format.html { redirect_to @message_thread, notice: 'Message thread was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message_thread.destroy

    respond_to do |format|
      format.html { redirect_to message_threads_url }
      format.json { head :no_content }
    end
  end

end
