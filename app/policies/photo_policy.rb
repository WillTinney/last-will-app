class PhotoPolicy < AssetPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
