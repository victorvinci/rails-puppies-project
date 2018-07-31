class PetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    is_user?
  end

  def update?
    is_user?
  end

  def destroy?
    is_user?
  end

  private
  def is_user?
    record.user_id == user
  end
end
