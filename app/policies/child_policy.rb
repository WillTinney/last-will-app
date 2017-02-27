class ChildPolicy < AssigneePolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
