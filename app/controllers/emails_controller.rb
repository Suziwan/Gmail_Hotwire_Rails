class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(object: Faker::Food.dish,
                      body: Faker::Food.description)
    @email.save

    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end
end
