class PhotoPolicy < AssetPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
