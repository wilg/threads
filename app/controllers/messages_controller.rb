class MessagesController < ApplicationController

  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  def new
    @message.project_id = Project.find(params[:project_id]).id if params[:project_id]
    @message.thread = MessageThread.find(params[:thread_id]) if params[:thread_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  def edit
  end

  def create
    @message.user = current_user
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message.thread, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
