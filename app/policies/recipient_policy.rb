class RecipientPolicy < AssigneePolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
