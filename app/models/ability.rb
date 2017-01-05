     class Ability
      include CanCan::Ability
 
      def initialize(user)

        unless user.nil? # guest
          # CanCan accepts a hash of conditions;
          # here, we're saying that the Post's user_id
          # needs to match the requesting User's id
          #can :update, Post, { user_id: user.id }
          can :read, Note , { user_id: user.id }
          can :read, Note do |note|
           note.readers.include?(user)
          end
          can :create, Note , { user_id: user.id }

          can :update, Note , { user_id: user.id }
        end

      end
    end