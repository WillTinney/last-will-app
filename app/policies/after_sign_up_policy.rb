class AfterSignUpPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record.user = user
  end

  def update?
    record.user = user
  end
end
