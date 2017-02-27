class AfterSignUpController < ApplicationController
  include Wicked::Wizard

  steps :sign_up, :basic_profile, :contact_info, :partner, :partner_basic, :children, :child_basic, :guardians, :guardian_basic

  def show
    if step == :partner_basic
      skip_step if !@user.partner?
      @assignee = @user.assignees.new
    elsif step == :child_basic
      skip_step if @user.number_of_children == 0
      @assignee = @user.assignees.new
      @children = []
      @user.number_of_children.times do
        @children << @user.assignees.new
      end
    elsif step == :guardian_basic
      skip_step if @user.number_of_guardians == 0
      @assignee = @user.assignees.new
      @guardians = []
      @user.number_of_guardians.times do
        @guardians << @user.assignees.new
      end
    end

    @user = current_user
    authorize @user

    sign_in(@user, bypass: true)
    render_wizard
  end

  def update
    @user = current_user
    authorize @user

    case step
      when :partner
        if params[:commit] == "Yes"
          @user.partner = true
        else
          @user.partner = false
        end
        @user.save
        render_wizard @user
      when :partner_basic
        @assignee = @user.assignees.new
        @assignee.update_attributes(assignee_params)
        sign_in(@user, bypass: true)
        render_wizard @assignee
      when :children
        @user.number_of_children = params[:commit].to_i
        @user.save
        render_wizard @user
      when :child_basic
        params['children'].each do |child|
          @user.assignees.create(sign_up_params(child))
        end
        sign_in(@user, bypass: true)
        redirect_to wizard_path(:guardians)
      when :guardians
        @user.number_of_guardians = params[:commit].to_i
        @user.save
        render_wizard @user
      when :guardian_basic
        params['guardians'].each do |child|
          @user.assignees.create(sign_up_params(child))
        end
        sign_in(@user, bypass: true)
        redirect_to user_profile_path(current_user)
      else
        @user.update_attributes(user_params)
        sign_in(@user, bypass: true)
        render_wizard @user
    end
  end

  def finish_wizard_path
    user_profile_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :title, :first_name, :middle_name, :last_name,
      :citizenship, :date_of_birth, :phone_number, :gender,
      :address_line_1, :address_line_2, :city, :country, :postcode,
      :latitude, :longitude, :profile_picture)
  end


  def sign_up_params(params)
    params.permit(:first_name, :last_name, :type, :relationship)
  end

  def assignee_params
    params.require(type ? type.downcase.to_sym : :assignee).permit(:first_name,
      :middle_name, :last_name, :citizenship, :date_of_birth, :email, :phone_number,
      :address_line_1, :address_line_2, :city, :country, :postcode, :relationship,
      :profile_picture, :type)
  end

  def type
    params[:type] || @assignee.type
  end
end
