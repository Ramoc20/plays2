module PlayersHelper
   def current_age(date_of_birth)
     return "Unknown" if date_of_birth.nil?
   
     now = Time.now.utc.to_date
     age = now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
     age
   end
 end
 