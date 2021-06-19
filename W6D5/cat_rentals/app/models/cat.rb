require 'action_view'

# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
        COLORS = ['brown', 'black', 'white', 'orange', 'grey', 'calico']
        GENDER = ['M', 'F', 'm', 'f']
        
        validates :birth_date, presence: true
        validates :color, inclusion: { in: COLORS,
                message: "%{value} is not a valid color"
                }

        validates :sex, presence: true, length: {is: 1}, inclusion: { in: GENDER,
                message: "%{value} is not a valid gender"
                }
                
        validates :name, presence: true
        
    def age
        # debugger
        time_ago_in_words(birth_date)
    end

end
