class Ability
  include CanCan::Ability

  def initialize(current_user)
    @user = current_user || User.new

    if @user.role == 'admin'
      can :delete, Comment
      can :delete, Post
    end

    can :delete, Comment, user_id: @user.id
    can :delete, Post, author_id: @user.id
  end
end
