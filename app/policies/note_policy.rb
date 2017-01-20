class NotePolicy < AssetPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
