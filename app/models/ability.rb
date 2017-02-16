class Ability
      include CanCan::Ability
 
      def initialize(user)

        unless user.nil?
          can :read, Note , { user_id: user.id }
          can :read, Note do |note|
           note.readers.include?(user)
          end
          can :create, Note , { user_id: user.id }

          can :update, Note , { user_id: user.id }
        end

      end
    end