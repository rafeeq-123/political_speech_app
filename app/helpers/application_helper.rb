module ApplicationHelper
  def all_users
    #add maybe user.active? user.speech.created_at > 1.hour.ago == active user.
    speech = Speech.all
    amount_unparsed = speech.map(&:user_id)
    @amount_of_parsed_users = amount_unparsed.uniq.count
  end
end
