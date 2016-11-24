module ApplicationHelper
  def all_users
    speech = Speech.all
    amount_unparsed = speech.map(&:user_id)
    @amount_of_parsed_users = amount_unparsed.uniq.count
  end
end
