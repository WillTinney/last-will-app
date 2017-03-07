class AssigneePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      scope.where(user: user)
    end
  end

  def show?
    user_is_owner?
  end

  def new?
    true
  end

  def edit?
    user_is_owner?
  end

  def create?
    user_is_owner?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def notes?
    user_is_owner?
  end

  def references?
    user_is_owner?
  end

  def photos?
    user_is_owner?
  end

  def videos?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
