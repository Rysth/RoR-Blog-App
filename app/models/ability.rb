# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post
    return unless user.present?  # additional permissions for logged in users (they can read their own posts)
    can :manage, Post, author_id: user.id
    can :manage, Comment, user_id: user.id
    can :create, Like
    return unless user.admin?  # additional permissions for administrators
    can :manage, :all
  end
end
