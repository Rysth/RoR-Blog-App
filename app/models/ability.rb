# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    return unless user.present?  # For normal Users
    can :manage, Post, author_id: user.id
    can :manage, Comment, user_id: user.id
    can :create, Like

    return unless user.admin?  # For Admins only
    can :manage, :all
  end
end
