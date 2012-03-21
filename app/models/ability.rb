class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.blank?
      cannot :magage, :all
      basic_read_only
    elsif user.has_role?(:admin)
      #admin
      can :manage, :all
    elsif user.has_role?(:member)
      #member

        #Post
      can :create, Post
      can :edit, Post
      can :update, Post do |post|
        post.user_id == user.id
      end
      can :destroy, Post do |post|
         post.user_id == user.id
      end
        
        #Comment
      can :create, Comment
      can :destroy, Comment do |comment|
        comment.user_id == user.id
      end
      basic_read_only
    else
      #Unknown
      cannot :magage, :all
      basic_read_only
    end
  end
  
  protected
  def basic_read_only
    can :read, Board
    can :read, Post
    can :read, Comment
  end
  # Define abilities for the passed in user here. For example:
  #
  #   user ||= User.new # guest user (not logged in)
  #   if user.admin?
  #     can :manage, :all
  #   else
  #     can :read, :all
  #   end
  #
  # The first argument to `can` is the action you are giving the user permission to do.
  # If you pass :manage it will apply to every action. Other common actions here are
  # :read, :create, :update and :destroy.
  #
  # The second argument is the resource the user can perform the action on. If you pass
  # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
  #
  # The third argument is an optional hash of conditions to further filter the objects.
  # For example, here the user can only update published articles.
  #
  #   can :update, Article, :published => true
  #
  # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
end
