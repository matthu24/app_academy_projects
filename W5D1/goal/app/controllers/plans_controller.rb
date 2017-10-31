class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save
      redirect_to plans_url
    else
      flash[:errors] = @plan.errors.full_messages
      render :new
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to plans_url
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      redirect_to plan_url(@plan)
    else
      flash[:errors] = @plan.errors.full_messages
      render :edit
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def index
    @plans = Plan.all
  end

  def plan_params
    params.require(:plan).permit(:body)
  end

end
