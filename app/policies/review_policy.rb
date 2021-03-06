class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    is_user?
  end

  def destroy?
    is_user?
  end

  private
  def is_user?
    record.user_id == user.id
  end
end
