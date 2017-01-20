class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user_is_user?
  end

  def new?
    user_is_user?
  end

  def edit?
    user_is_user?
  end

  def create?
    user_is_user?
  end

  def update?
    user_is_user?
  end

  def destroy?
    user_is_user?
  end

  def profile?
    user_is_user?
  end

  def call_to_action?
    user_is_user?
  end

  def digital?
    user_is_user?
  end

  def proof?
    user_is_user?
  end

  def notes?
    user_is_user?
  end

  def admin?
    user_is_user?
  end

  def photos?
    user_is_user?
  end

  def video?
    user_is_user?
  end

  private

  def user_is_user?
    record == user
  end
end
