class EmailsController < ApplicationController
  def index
    @emails = Email.all
    @email = Email.new
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(object: Faker::Food.dish,
                      body: Faker::Food.description,
                      read: false)
    @email.save

    respond_to do |format|
      if @email.save
        format.html { redirect_to emails_path, notice: 'New email received!' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to emails_path, notice: 'Email deleted !'
  end

  def toggle
    @email = Email.find(params[:id])
    @email.update(read: params[:read])

    render json: { message: 'Success' }
  end
end
