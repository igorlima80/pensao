class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    end

    if user.has_role? :franchisee
      can :manage, Property
      can :read, Accommodation do |accomodation|
        user.properties.pluck(:id).include? accomodation.property_id
      end
      can :manage, Reserve
      can :manage, Unavailability
    end

    if user.has_role? :property
      can :manage, [Accommodation, Reserve, Cancellation, Unavailability, Rating, Fee, Service]
    end
  end
end
